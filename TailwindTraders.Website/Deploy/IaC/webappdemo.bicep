param webAppName string = 'DEV-TailwindTraders-ADO40'
param sku string = 'S1'
param linuxFxVersion string = 'DOTNETCORE|5.0'
param location string = 'westeurope'

var appServicePlanName = toLower('asp-${webAppName}')
var webSiteName = toLower('wapp-${webAppName}')

resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: appServicePlanName
  location: location
  properties: {
    reserved: true
  }
  sku: {
    name: sku
  }
  kind: 'linux'
}

resource appService 'Microsoft.Web/sites@2020-06-01' = {
  name: webSiteName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: linuxFxVersion
      alwaysOn: true
    }
  }
}
