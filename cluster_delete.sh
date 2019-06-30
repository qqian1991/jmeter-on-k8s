#!/bin/bash
echo "deleting jmeter"
kubectl delete -f manifest -n jmeter 
echo

echo "Deleteing Namespace: jmeter"
kubectl delete namespace jmeter
echo 
