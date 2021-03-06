#!/bin/bash

# Add the Azure CLI extension 
az extension add --name rdbms

# Create a resource group
az group create \
--name myresourcegroup \
--location westus

# Create a PostgreSQL server in the resource group
# Name of a server maps to DNS name and is thus required to be globally unique in Azure.
# Substitute the <server_admin_password> with your own value.
az postgres server create \
--name mydemoserver \
--resource-group myresourcegroup \
--location westus \
--admin-user myadmin \
--admin-password <server_admin_password> \
--sku-name GP_Gen4_2 \

# Restore a server from backup to a new server
az postgres server restore \
--name mydemoserver-restored \
--resource-group myresourcegroup \
--restore-point-in-time "2018-02-11T13:10:00Z" \
--source-server mydemoserver