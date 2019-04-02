

# Configure the user profile on aws cli
aws config

# Build and push images

cd /home/javier/Documents/aws/trambo-training/exercises/docker-intermediate_exercises/03-docker_compose/flask-redis-app
docker build -t trambo-training-pythonflask .
docker tag trambo-training-pythonflask carpio701021/trambo-training-pythonflask 
docker push carpio701021/trambo-training-pythonflask

cd /home/javier/Documents/aws/trambo-training/exercises/docker-intermediate_exercises/03-docker_compose/static-server
docker build -t trambo-training-static .
docker tag trambo-training-static carpio701021/trambo-training-static 
docker push carpio701021/trambo-training-static

cd /home/javier/Documents/aws/trambo-training/exercises/docker-intermediate_exercises/03-docker_compose/proxy-server
docker build -t trambo-training-proxy .
docker tag trambo-training-proxy carpio701021/trambo-training-proxy 
docker push carpio701021/trambo-training-proxy

# Create the stacks
aws cloudformation create-stack --template-body file://$PWD/infra/01-network.yml --stack-name vpc
aws cloudformation create-stack --template-body file://$PWD/infra/02-app-cluster.yml --stack-name app-cluster 
aws cloudformation create-stack --template-body file://$PWD/infra/03-elastic-cache.yml --stack-name elastic-cache
aws cloudformation create-stack --template-body file://$PWD/infra/04-iam.yml --stack-name iam --capabilities CAPABILITY_IAM
aws cloudformation create-stack --template-body file://$PWD/infra/05-deploy-app.yml --stack-name deploy-app

# Delete the stacks
aws cloudformation delete-stack --stack-name deploy-app
aws cloudformation delete-stack --stack-name iam
aws cloudformation delete-stack --stack-name elastic-cache
aws cloudformation delete-stack --stack-name app-cluster 
aws cloudformation delete-stack --stack-name vpc

