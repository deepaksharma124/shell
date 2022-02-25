#!/bin/bash

kubectl get pods -n kube-system | grep kubearmor

if  [  $? -eq "0" ]
then
 echo "Kubearmor exist here."
elif
 karmor version
then 
 karmor install
elif
 curl -sfL https://raw.githubusercontent.com/kubearmor/kubearmor-client/main/install.sh | sudo sh -s -- -b /usr/local/bin
then 
 karmor install
fi
echo "Congratulation! Kubearmor is Ready here."
kubectl get pods -n kube-system | grep kubearmor
