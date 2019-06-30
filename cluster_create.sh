#!/bin/bash
echo "Creating Namespace: jmeter"
kubectl create namespace jmeter
echo 

echo "create jmeter cluster with influxDB and Grafana"
kubectl create -f manifest -n jmeter 
echo

sleep 60
master_pod=`kubectl get po -n jmeter | grep jmeter-master | awk '{print $1}'`
kubectl exec -ti -n jmeter $master_pod -- cp -r /load_test /jmeter/load_test
kubectl exec -ti -n jmeter $master_pod -- chmod 755 /jmeter/load_test

echo "Printout Of the jmeter Objects"
kubectl get all -n jmeter


