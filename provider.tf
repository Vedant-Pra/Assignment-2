terraform {
required_providers {
aws = {
source  = "hashicorp/aws"
version = "~> 3.0"
}
}
}


# Configure the AWS provider

provider "aws" {
region = "us-east-1" # Replace with your desired region
access_key = "ASIA4DKL55CCHJ5B3TNQ"
secret_key = "lZafD3nC7TmuVpypllc3njMsss4CwlmjspmMH5r1"
token = "FwoGZXIvYXdzEOP//////////wEaDECUlGK4hvZOtqk/PCKvAS8wcuqiuzI5q9Thz80SNizdMB0p6aL+cwPIvkt4aSVU12A0sbLjEI/xPVMBSj+T99HS7PooKatpdOKB4GtecHUMLTDi5BqB8WFJqW2j96XqIaA26WSo7lhC1cz/XADvlzY9SpDwKhhqj6zcag5msdxLQDebOSt5cHhNx/ujqU63wXxKruQ/sovypFjoYlEdC96ziwGI9U92prVuVyKsSdAxH9lUCkpXTbGMUawy/H8o5rPxrgYyLQTaMDrRpq2/WHQoN0+rx4UlkYT1h0Ks65twC2LhkEi3ryAhATsonwIZkq8DQQ=="
}
