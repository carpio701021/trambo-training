

# Configure the user profile on aws cli
aws config


aws cloudformation create-stack --stack-name trambo-ecs --template-body file://$PWD/stack.yml --region us-west-2

aws cloudformation delete-stack --stack-name trambo-ecs 



aws cloudformation create-stack --template-body file://$PWD/infra/01-network.yml --stack-name vpc

aws cloudformation create-stack --template-body file://$PWD/infra/02-app-cluster.yml --stack-name app-cluster 

aws cloudformation create-stack --template-body file://$PWD/infra/03-elastic-cache.yml --stack-name elastic-cache

aws cloudformation create-stack --template-body file://$PWD/infra/04-deploy-app.yml --stack-name deploy-app

