# DVO305 Demo
This is the demo for the 'Turbocharge Your Continuous Deployment Pipeline with Containers' re:Invent session.

## Setup
### Pre-requisites
* Make sure you followed the [ECS getting started](http://docs.aws.amazon.com/AmazonECS/latest/developerguide/get-set-up-for-amazon-ecs.html) steps before continuing.
* For this demo we'll be using the us-east-1 region.

### Steps
1. [Create](http://docs.aws.amazon.com/AmazonECS/latest/developerguide/ECS_AWSCLI.html#AWSCLI_create_cluster) two ECS clusters: *staging* and *production*.
2. [Launch](http://docs.aws.amazon.com/AmazonECS/latest/developerguide/launch_container_instance.html) Container instances in both clusters using the latest ECS Optimized AMI (*amzn-ami-2015.03.g-amazon-ecs-optimized* as of Sept 14th). Specify a Security Group that allows access to ports *TCP/80*, *TCP/8080* and *TCP/22*. Make sure you specify the ECS cluster to join in the user data section:

		#!/bin/bash
		# Join the ECS Cluster
		echo ECS_CLUSTER=<CLUSTER_NAME> >> /etc/ecs/ecs.config

3. [Launch](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/LaunchingAndUsingInstances.html) an EC2 instance, connect to it and install Jenkins.
4. Install and configure the Cloudbees ECS Plugin. Create a build job for the Photogram demo app. Restrict execution of the job to the ECS Slaves.
5. Add a new **Freestyle project** job (e.g. photogram). Select the **Restrict where this project can be run** and add the label used when configuring the Cloudbees ECS Plugin (e.g. ECS_Slave). Configure the Github repository (e.g. https://github.com/awslabs/dvo305-demo) and select the **Build when a change is pushed to GitHub** option. Add a **Invoke Rake** step to execute the Spec tests.
6. [Create a PostgreSQL RDS instance](http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_CreatePostgreSQLInstance.html), allowing access to it from the ECS instances' Security Group. Once the instance is ready, update the database-related environment variables in `docker-compose.yml`. Note that these database variables will be set automatically by Elastic Beanstalk if running on Elastic Beanstalk using a Beanstalk-managed RDS instance.
7. [Create](http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/using-features.deployment.newapp.html) a [Multicontainer Docker](http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/create_deploy_docker_ecs.html) Elastic Beanstalk Application.
8. [Create a Pipeline](http://docs.aws.amazon.com/codepipeline/latest/userguide/how-to-create-pipelines.html) that gets the sources from Github and deploys to Elastic Beanstalk.
9. Start the app on your local environment

		docker-compose up

## Script
### Development scenario
1. Show app up and running
2. Introduce small change
3. Re-start app and show change

### Build/Test scenario
1. Show Jenkins and CodePipeline setup
2. Show how images are built

### Deployment scenario
1. Show prod app (still old version)
2. Push changes
3. Wait for deployment, show new version
