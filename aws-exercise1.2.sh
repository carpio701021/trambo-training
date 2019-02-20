carpio-training1.2

carpio-training1.2-VPC

carpio-training1.2-SN-public-1
carpio-training1.2-SN-private-1
carpio-training1.2-SN-private-2

carpio-training1.2-RT-public
carpio-training1.2-RT-private


carpio-training1.2-SG-instances
carpio-training1.2-SG-ELB

carpio-training1.2-IGW
carpio-training1.2-NW



carpio-training1.2-ASC-launchconfig
carpio-training1.2-ASC



#######################################################################
#!/bin/bash
yum update -y
#yum install -y nginx
amazon-linux-extras install nginx1.12
cat > /usr/share/nginx/html/index.html <<EOL
<html>
<body>
<h1>Training 1.2</h1>
<p>Instance <strong>$HOSTNAME</strong> launched.</p>
<h2>Javier Carpio</h2>
</body>
</html>
EOL

service nginx start
#######################################################################


carpio-training1-2-ELB-classic
