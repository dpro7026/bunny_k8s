# RabbitMQ implemented with Ruby packaged with Docker Compose
## Running the Application:
Only the first time requires building of the Docker images:
```
docker-compose build
```
Then run the micro-services:
```
docker-compose up -d
```
The application will take a minute for RabbitMQ to begin, then proceed to:
http://localhost:15672 </br>
Login with username: guest, password: guest </br>
</br>
To stop the application:
```
docker-compose down
```

## Using Kubernetes for Deployment
Login to Dockerhub:
```
docker login docker.io
```
Push the app image to Dockerhub:
```
docker-compose push app
```
Create the Kubernetes deployment and service config files:
```
kompose convert -f docker-compose.yml
```
Create the deployment and services from the config files:
```
kubectl create -f rabbitmq-deployment.yaml
kubectl create -f rabbitmq-service.yaml
kubectl create -f rabbitmq-claim0-persistentvolumeclaim.yaml
kubectl create -f app-pod.yaml
```
Check the pods health:
```
kubectl get pods
```
To access http://localhost:15672 we require a loadbalancer:
```
kubectl expose deployment rabbitmq --type=LoadBalancer --name=rabbitmq-lb
```

TODO:
Combine kubectl create -f into a single command
Change app from pod to deployment (for scalability)
Give volume a better config filename 
Do next exercise on RabbitMQ tutorial
