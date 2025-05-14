**Ansible Practice**

Ansible installtion script for instation - ansible-installtion.sh

"""
git clone https://github.com/abhay-dandge/ansible.git

cd ansible

chmod +x ansible-installtion.sh

sh ansible-installtion.sh

"""


**Personal Docker image = docker.io/abhaydandgedocker/myansible**

1 control container using your custom image docker.io/abhaydandgedocker/myansible

5 Ubuntu containers

All in the same pod or networked together, so they can communicate using hostnames

**Deploy All in Kubernetes**

kubectl apply -f myansible-deployment.yaml


kubectl apply -f ubuntu-headless-service.yaml


kubectl apply -f ubuntu-statefulset.yaml


**Test DNS Communication**

kubectl exec -it deploy/myansible -- bash


ping ubuntu-0.ubuntu

ping ubuntu-1.ubuntu
...


**This works because Kubernetes assigns each StatefulSet pod a DNS entry like:**

<stateful-pod-name>.<headless-service-name>


