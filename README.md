# Azurite Sample Project

Azure Account Template deployed via [Azurite](https://github.com/NathanKewley/azurite)

Azurite required subscriptions to already exist but will create resource groups for you if required.

## deploy

* Ensure you have Azurite installed
* Login to Azure via the Azure CLI
* From the root of this directory run: `azurite deploy-account`

## Infra that will be deployed

* Hub and Spoke network across multiple subscriptions
* Azure Firewall in hub subscription
* Azure Policy at the subscription layer.

![networkLayout](docs/networkLayout.jpg)

## Example output of Azurite command

```
2025-10-31 14:55:10,494 - logging - DEBUG - Namespace(operation=['deploy_account'], suboperation=None) (__init__.py:28)
2025-10-31 14:55:10,778 - logging - DEBUG - Setting Subscription: shared-services-prod (subscription.py:20)
2025-10-31 14:55:11,927 - logging - INFO - Deployment has dependancies. Resolving... (orchestrator.py:64)
2025-10-31 14:55:11,931 - logging - INFO - Deploying: shared-services-prod/rg-networking/virtual-network.yaml to shared-services-prod (orchestrator.py:83)
2025-10-31 14:55:12,991 - logging - INFO - Creating resource group: 'rg-networking' in australiaeast (subproc.py:30)
2025-10-31 14:55:14,975 - logging - DEBUG - Deployment Name: shared-services-prod.rg-networking.virtual-network (deployer.py:60)
2025-10-31 14:55:14,975 - logging - DEBUG - command: az deployment group create -f bicep/virtual-network/virtualNetworkHub.bicep -g rg-networking --mode Incremental --name shared-services-prod.rg-networking.virtual-network --parameters name=Shared-Services-Prod location=australiaeast addressPrefixs=['10.0.0.0/20'] firewallSubnetName=AzureFirewallSubnet firewallSubnetAddressPrefix=10.0.3.0/26 vpnSubnetName=Shared-Services-VPN vpnSubnetAddressPrefix=10.0.2.0/27 --output json (subproc.py:36)
2025-10-31 14:56:32,270 - logging - DEBUG - Deploy Complete
 (deployer.py:64)
2025-10-31 14:56:32,534 - logging - DEBUG - Setting Subscription: cloudops-prod (subscription.py:20)
2025-10-31 14:56:33,896 - logging - INFO - Deployment has dependancies. Resolving... (orchestrator.py:64)
2025-10-31 14:56:33,901 - logging - INFO - Deploying: cloudops-prod/rg-networking/virtual-network.yaml to cloudops-prod (orchestrator.py:83)
2025-10-31 14:56:34,660 - logging - INFO - Creating resource group: 'rg-networking' in australiaeast (subproc.py:30)
2025-10-31 14:56:35,510 - logging - DEBUG - Deployment Name: cloudops-prod.rg-networking.virtual-network (deployer.py:60)
2025-10-31 14:56:35,510 - logging - DEBUG - command: az deployment group create -f bicep/virtual-network/virtualNetworkSpoke.bicep -g rg-networking --mode Incremental --name cloudops-prod.rg-networking.virtual-network --parameters name=CloudOps-Prod location=australiaeast addressPrefixs=['10.100.0.0/16'] subnetName=CloudOps-Prod subnetAddressPrefix=10.100.0.0/16 --output json (subproc.py:36)
```

## Need to expand on this sample project and docco

to do
