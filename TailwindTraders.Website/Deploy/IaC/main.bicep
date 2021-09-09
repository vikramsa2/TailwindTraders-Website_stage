param location string = 'centralus'
param rgName string = 'RG-Dev-TailwindTraders'

resource rg 'Microsoft.Resources/resourceGroups@2020-06-01' = {
  name: rgName
  location: location
}

module WebApp './webappdemo.bicep' = {
  name: 'DevWebapp'
  scope: resourceGroup(rgName)
  params: {
    location: location
 }
}


