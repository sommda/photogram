#!/bin/bash
export TEST_SERVER=$1
xvfb-run -a rspec spec/features/signin_spec.rb

