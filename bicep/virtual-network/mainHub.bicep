param name string
param location string
param addressPrefixs array
param firewallSubnetName string
param firewallSubnetAddressPrefix string
param SubnetName string
param SubnetAddressPrefix string
param deployFirewall bool

module virtualNetworkHub './resources/virtualNetworkHub.bicep' = {
  name: 'virtualNetworkHub'
  params: {
     name: name
     location: location
     addressPrefixs: addressPrefixs
     firewallSubnetName: firewallSubnetName
     firewallSubnetAddressPrefix: firewallSubnetAddressPrefix
     SubnetName: SubnetName
     SubnetAddressPrefix: SubnetAddressPrefix
  }
}

module NSGDenyAllInbound './resources/networkSecurityGroup.bicep' = {
  name: 'NSGDenyAllInbound'
  params: {
    networkSecurityGroupName: 'NSGDenyAllInbound'
    location: location
  }
}

module firewall './resources/firewall.bicep' = if (deployFirewall) {
  name: 'firewall'
  params: {
    firewallName: 'hubFirewall'
    location: location
    firewallIPSKU: 'Standard'
    firewallSKUName: 'AZFW_VNet'
    firewallSKUTier: 'Standard'
    virtualNetwork: virtualNetworkHub.outputs.virtualNetworkId
    firewallSubnetName: virtualNetworkHub.outputs.firewallSubnetName
  }
}

output virtualNetworkId string = virtualNetworkHub.outputs.virtualNetworkId
output firewallSubnetName string = virtualNetworkHub.outputs.firewallSubnetName
output networkName string = virtualNetworkHub.outputs.networkName
output NSGOutput1 string = NSGDenyAllInbound.outputs.networkSecurityGroupId
