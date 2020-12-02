# terraform_ansible_docker_jenkins_awsproject

## Archeticture :
![aws infra soln (1)](https://user-images.githubusercontent.com/68178003/100848077-510e7d00-3489-11eb-9603-805b5cf6b78f.jpeg)

## Scenario :
* Using terraform to deploy 2 instances on AWS
* configuring them using ansible one to be used as jenkins and the other as webserver
* connecting jenkins to the webserver using ssh and deploying to it a docker container exposing a python application

** Proven steps:

1. after applying terraform :

![Screenshot from 2020-11-30 11-27-09](https://user-images.githubusercontent.com/68178003/100592489-d6febc80-32ff-11eb-9538-af04d2a1e5f5.png)

2. web security group inbound rules:

![Screenshot from 2020-11-30 11-28-20](https://user-images.githubusercontent.com/68178003/100592504-da924380-32ff-11eb-95c9-ffde823df61c.png)

3. building image using jenkinsfile in jenkins: 

![Screenshot from 2020-11-30 11-27-09](https://user-images.githubusercontent.com/68178003/100592489-d6febc80-32ff-11eb-9538-af04d2a1e5f5.png)

![Screenshot from 2020-11-30 11-28-20](https://user-images.githubusercontent.com/68178003/100592504-da924380-32ff-11eb-95c9-ffde823df61c.png)

4. image deployed to mydockerhub account:

![Screenshot from 2020-11-30 12-06-09](https://user-images.githubusercontent.com/68178003/100596169-876ebf80-3304-11eb-8640-dc10bb59b472.png)

5. connection between jenkins to web instance to deploy docker app after building and deploying image using jenkinsfile :

![Screenshot from 2020-11-30 11-26-35](https://user-images.githubusercontent.com/68178003/100592481-d36b3580-32ff-11eb-8b14-3a5b4038ad9b.png)


![Screenshot from 2020-11-30 11-25-10](https://user-images.githubusercontent.com/68178003/100592463-d108db80-32ff-11eb-96f9-ede312123b3a.png)

6. Finally image is exposed to outside world on webserver ec2 instance :

![Screenshot from 2020-11-30 11-31-24](https://user-images.githubusercontent.com/68178003/100592518-dd8d3400-32ff-11eb-803b-7011f7309004.png)
