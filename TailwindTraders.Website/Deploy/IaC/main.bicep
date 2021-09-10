targetScope = 'subscription'

param location string = 'centralus'
param rgName string = 'RG-Exampe'
param webAppName string = 'mywebapp'

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


