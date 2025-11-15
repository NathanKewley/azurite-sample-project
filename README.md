# Azurite Sample Project

Azure Account Template deployed via [Azurite](https://github.com/NathanKewley/azurite)

Azurite required subscriptions to already exist but will create resource groups for you if required.

## deploy

* Ensure you have Azurite installed
* Login to Azure via the Azure CLI
* From the root of this directory run: `azurite deploy-account`

## Infra that will be deployed

* Hub and Spoke network across multiple subscriptions including peering of VNets
* Azure Firewall in hub subscription
* Azure Policy at the subscription layer

![networkLayout](docs/networkLayout.jpg)

## Example output of Azurite command

```
2025-11-15 13:57:41,394 - logging - INFO - Deployment has dependencies. Resolving... (orchestrator.py:73)
2025-11-15 13:57:41,399 - logging - INFO - deploying: services-prod/rg-azurite-sample-01/azurite_automation_storage.yaml to services-prod (orchestrator.py:104)
2025-11-15 13:59:04,046 - logging - INFO - Deploy Complete
 (deployer.py:66)
2025-11-15 13:59:04,449 - logging - INFO - deploying: services-prod/rg-azurite-sample-02/sample_storage.yaml to services-prod (orchestrator.py:104)
2025-11-15 13:59:56,293 - logging - INFO - Deploy Complete
 (deployer.py:66)
```

## Need to expand on this sample project and docco

to do
