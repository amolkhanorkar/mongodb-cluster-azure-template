### mongodb-cluster-azure-template

Author - "Amol Khanorkar"

This ARM template will help you to create MongoDB Cluster with below components.

- 1 Router VM
- 2 Config VMs
- 3 Replicaset VMs

This cluster will deployed all the VMs in single Availability-Set which ensures the high-availability of cluster more. You can change the VM type, resources names (variables) and regions as per your requirements. 

P.S. 'Before deploying this template please ensure your subscription has sufficient amount of crerdits.'


<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Famolkhanorkar%2Fmongodb-cluster-azure-template%2Fstage%2Ftemplate.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Famolkhanorkar%2Fmongodb-cluster-azure-template%2Fstage%2Ftemplate.json" target="_blank">
