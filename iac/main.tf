# Versions 
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.40.0"
    }
  }
}

# Authentication to AWS from Terraform code
provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

terraform {
  backend "s3" {
    bucket = "raazproject"
    key    = "projects_statefile/terraform.state"
    region = "us-east-1"
  }
}

# Continuous Integration - Jenkins
resource "aws_instance" "cloud_jenkins" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = ["sg-06d79fa88b705cd2e"]
  user_data              = file("jenkins.sh")
  tags = {
    Name      = "cloud_Jenkins"
    CreatedBy = "Terraform"
  }
}

# Continuous Static Code Analysis Tool - sonarqube
resource "aws_instance" "cloud_sonarqube" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = ["sg-06d79fa88b705cd2e"]
  user_data              = file("sonarqube.sh")
  tags = {
    Name      = "cloud_sonarqube"
    CreatedBy = "Terraform"
  }
}

# Continuous Binary Code Repository Tool - JFROG
resource "aws_instance" "cloud_jfrog" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = ["sg-06d79fa88b705cd2e"]
  user_data              = file("jfrog.sh")
  tags = {
    Name      = "cloud_jfrog"
    CreatedBy = "Terraform"
  }
}

# Application Server - APACHE TOMCAT
resource "aws_instance" "cloud_tomcat" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = ["sg-06d79fa88b705cd2e"]
  user_data              = file("tomcat.sh")
  tags = {
    Name      = "cloud_tomcat"
    CreatedBy = "Terraform"
  }
}