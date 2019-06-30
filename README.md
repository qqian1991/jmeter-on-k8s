# jmeter-on-k8s


## 1. Create Cluster

```
./cluster_create.sh
./db_and_datasource_create.sh
./start_test.sh example.jmx
```


## 2. Start Test

```
./start_test.sh example.jmx
```


## 3. Stop Test

```
./jmeter_stop.sh
```


## 4. Delete Cluster

```
./cluster_delete.sh 
```
