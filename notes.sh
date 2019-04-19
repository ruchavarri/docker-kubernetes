

#1) docker management
docker create hello-world
docker run -a d4233bf1e691d60ea0f0bdd198b93007113dac1909444b89bff3fd6d923dccc9

docker create busybox ping google.com
docker run "containerId" 
docker log "containerId"

#custom Dockerfile
docker build .
docker build -t ruchavarri/redis:latest .
docker build -t ruchavarri/simpleweb .
docker exec -it 27a95bf05bca sh

#specify port outside:inside
docker run -p 5000:8080 ruchavarri/simpleweb

#specify work in background
docker run -d redis

#5) 
docker-compose
docker-compose up
docker-compose up --build

docker-compose up -d 
docker-compose down

#must be in the same folder where the docker-compose is
docker-compose ps 


#6) deploy in production
install create-react-app -g
create-react-app frontend
docker run -p 3000:3000 471ebb623efe

docker run -p 3000:3000 -v $(pwd):/app dffdbc8509b3
#prevent to remap node_modules
docker run -p 3000:3000 -v /app/node_modules -v $(pwd):/app dffdbc8509b3

#test inside container with interactivity
docker run -it 142654c9e9c8 npm run test

#dynamic tests
docker-compose up
docker exec -it d2e340202337 npm run test


#7) Travis
https://travis-ci.org/



















