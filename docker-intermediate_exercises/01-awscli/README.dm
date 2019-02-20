
# Usage

docker run \
-v <path to aws configs and credentials>:/root/.aws:ro  \
trambo-training-awscli \
<aws-cli command>

# Example

docker run \
-v /home/javier/Documents/aws/trambo-training/exercises/docker-intermediate_exercises/01-awscli/aws:/root/.aws:ro  \
trambo-training-awscli \
s3 ls
