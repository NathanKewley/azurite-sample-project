param name string
param location string
param addressPrefixs array
param subnetName string
param subnetAddressPrefix string

module virtualNetworkHub './resources/virtualNetworkSpoke.bicep' = {
  name: 'virtualNetworkHub'
  params: {
     name: name
     location: location
     addressPrefixs: addressPrefixs
     subnetName: subnetName
     subnetAddressPrefix: subnetAddressPrefix
  }
}

output virtualNetworkId string = virtualNetworkHub.outputs.virtualNetworkId
output networkName string = virtualNetworkHub.outputs.networkName
