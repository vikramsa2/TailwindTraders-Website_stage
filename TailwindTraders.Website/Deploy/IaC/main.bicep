targetScope = 'subscription'

param location string = 'westeurope'
param rgName string = 'RG-Dev-TailwindTraders'
param webAppName string = 'DEV-TailwindTraders-ADO40'

resource rg 'Microsoft.Resources/resourceGroups@2020-06-01' = {
  name: rgName
  location: location
}

module WebApp './webappdemo.bicep' = {
  name: webAppName
  scope: resourceGroup(rg.name)
  params: {
    webAppName: webAppName
    location: location
  }
}


