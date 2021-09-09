param location string = 'centralus'
param rgName string = 'RG-TWTradersADO40'

resource rg 'Microsoft.Resources/resourceGroups@2020-06-01' = {
  name: rgName
  location: location
}

module ACR './ACRDemo.bicep' = {
  name: 'ACR Demo'
  scope: resourceGroup(rgName)
  params: {
    location: location
 }
}

output acrLoginServer string = acr.properties.loginServer
