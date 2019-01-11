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
