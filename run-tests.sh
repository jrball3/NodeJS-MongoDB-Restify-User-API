docker-compose build && docker-compose up -d --force-recreate
docker exec -e WAIT_HOSTS=localhost:3000 -it app_user_api_1 sh -c "/wait && npm test"
docker logs app_user_api_1
docker-compose down
