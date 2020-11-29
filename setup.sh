#!/bin/bash

#starting minikube
minikube start --driver=virtualbox

#enable and configure load balancer
minikube addons enable metallb
kubectl apply -f srcs/metallb.yaml

#enable dashboard
minikube addons enable dashboard

#enable to use docker inside minikube
eval $(minikube docker-env)

#building all containers
docker build -t nginx:latest srcs/nginx/
docker build -t mysql:latest srcs/mysql/
docker build -t wordpress:latest srcs/wordpress/
docker build -t phpmyadmin:latest srcs/phpmyadmin/
docker build -t influxdb srcs/influxdb/
docker build -t telegraf srcs/telegraf/
docker build -t grafana srcs/grafana/
docker build -t ftps srcs/ftps/

#create kubernetes deployments and services
kubectl create -f srcs/yaml/

#opent minikube dashboard
minikube dashboard