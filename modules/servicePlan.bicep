param namePrefix string
param location string = resourceGroup().location
param sku string = 'B1'


resource appServicePlan 'Microsoft.Web/serverfarms@2023-12-01' = {
  name: '${namePrefix}ap'
  location: location
  kind: 'linux'
  sku: {
    name: sku
  }

  properties: {
    // this will make sure the app service can run only linux
    reserved: true
  }
}

output planId string = appServicePlan.id
