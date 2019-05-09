

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


#9) Dockerizing mutiple services
#force rebuild docker-compose
docker-compose up --build

#digital ocean doesn't provide "cache elastic service"

#13) kubernetes

#config kubernetes
kubectl apply -f 'filename' 
#get kubernetes status
kubectl get pods
kubectl get services

#get kubernetes ip insted of localhost
minikube ip

#update 
kubectl apply -f client-pod.yml
kubectl describe <object type> <object name (optional)>
kubectl describe pod client-pod
kubectl delete -f client-pod.yml

kubectl get pods -o wide

docker build -t ruchavarri/multi-client:v5 .
docker push ruchavarri/multi-client:v5

kubectl set image <object_tupe>/<object_name><container_name>=nex image to use>
kubectl set image deployment/client-deployment client=ruchavarri/multi-client:v5

#configure command line to point to virtual machine
eval $(minikube docker-env)

#interact with kubernetes with docker
docker ps
docker logs <containerID>
docker exec -it <containerID> sh

kubectl get pods
kubectl log client-deployment-bb8fd8c98-7xz9w

docker system prune -a

#14) 














