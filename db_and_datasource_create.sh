#!/bin/bash
echo "Creating Influxdb jmeter Database"
influxdb_pod=`kubectl get po -n jmeter | grep influxdb-jmeter | awk '{print $1}'`
kubectl exec -ti -n jmeter $influxdb_pod -- influx -execute 'CREATE DATABASE jmeter'


echo "Creating the Influxdb data source"
grafana_pod=`kubectl get po -n jmeter | grep jmeter-grafana | awk '{print $1}'`
kubectl exec -ti -n jmeter $grafana_pod -- curl 'http://admin:admin@127.0.0.1:3000/api/datasources' -X POST -H 'Content-Type: application/json;charset=UTF-8' --data-binary '{"name":"jmeterdb","type":"influxdb","url":"http://jmeter-influxdb:8086","access":"proxy","isDefault":true,"database":"jmeter","user":"admin","password":"admin"}'


