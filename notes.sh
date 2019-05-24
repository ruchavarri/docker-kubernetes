#full source code in 
https://github.com/StephenGrider/DockerCasts

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

kubectl apply -f k8s
kubectl get deployments
kubectl get pods
kubectl get services
kubectl logs server-deployment-565ccb65fc-ln2q5

#PVC: Persistent Volume Claim
#(197) Volume (in Kubernetes): persistant file system that it is not only store inside pod.
#(199) Persistent Volume: Long term durable storage (that is no linked to pod / container)
#(200) Persistent Volume Claim: Advertisement list of options

kubectl get pv

#Create Secrets

kubectl create secret generic "secret-name" --from-literal key=value
kubectl create secret generic pgpassword --from-literal PGPASSWORD=12345asdf
kubectl get secrets

#(211) Load Balancer vs Ingress
# LoadBalancer: Legacy way of getting network traffic into a cluster
# Ingress: Exposes a set of services to the outside world

# (216) Optional Reading on Ingress Nginx
# Just in case you wanted to understand ingress-nginx a bit better, check out this article by Hongli Lai - https://www.joyfulbikeshedding.com/blog/2018-03-26-studying-the-kubernetes-ingress-system.html.  Hongli is an absolute genius, he co-created Phusion Passenger, an extremely popular webserver that integrates with Nginx.

#https://kubernetes.github.io/ingress-nginx/deploy/#prerequisite-generic-deployment-command
# init ingress
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/mandatory.yaml
minikube addons enable ingress

kubectl apply -f k8s

# minikube dashboard
minikube dashboard

#16) Kubernetes Production Deployment

https://cloud.google.com/products/calculator/

#Why google cloud?
#Google created Kubernetes! 
#AWS only recently got Kubernetes support
#Far, far easier to poke around Kubernetes on Google Cloud
#Excellent documentation for begginers

#(230) create a cluster

docker run -it -v $(pwd):/app ruby:2.3 sh
gem install travis --no-doc

#config gcloud command line (using main account credentials)
gcloud config set project multi-k8s-240723
gcloud config set compute/zone us-central1-a
gcloud container clusters get-credentials multi-cluster
kubectl create secret generic pgpassword --from-literal PGPASSWORD=12345asdf

# What is HELM?
https://kubernetes.github.io/ingress-nginx/deploy/#using-helm
https://github.com/helm/helm
https://helm.sh/docs/using_helm/#quickstart-guide

# (RBAC) Role Based Access Control
kubectl create serviceaccount --namespace kube-system tiller
kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
clusterrolebinding.rbac.authorization.k8s.io/tiller-cluster-rule created

helm init --service-account tiller --upgrade

helm install stable/nginx-ingress --name my-nginx --set rbac.create=true

#Review with source code
https://github.com/StephenGrider/DockerCasts


#17) HTTPS setup with Kubernetes
domains.google.com

#Config DNS: using Load Balancer IP (without ther port)

github.com/jetstack/cert-manager

kubectl get certificates

kubectl get secrets





















