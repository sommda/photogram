{
  "AWSEBDockerrunVersion": 2,
  "containerDefinitions": [
    {
      "name": "proxy",
      "image": "sommda/dvo305-proxy:v_BUILD_NUMBER",
      "essential": true,
      "memory": 512,
      "portMappings": [
        {
          "hostPort": 80,
          "containerPort": 80
        }
      ],
      "links": [
        "web"
      ]
    },
    {
      "name": "web",
      "image": "sommda/dvo305-web:v_BUILD_NUMBER",
      "essential": true,
      "memory": 512,
      "portMappings": [
        {
          "hostPort": 3000,
          "containerPort": 3000
        }
      ],
      "environment" : [
        {
          "name": "SECRET_KEY_BASE",
          "value": "eeb58e7c5a1f01d5f7ac66cda0a935dd42f994ccd599d848f90f0c8f264ffc89e3102a01c0dda815f1834de4e937d180ef6004efa55258df2d6be4a2e5a2c21f"
        }
      ],
      "command" : ["bundle", "exec", "rails", "server", "-e", "production", "-b", "0.0.0.0"]
    }
  ]
}
