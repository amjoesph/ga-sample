
param namePrefix string = 'shop2'
param location string = resourceGroup().location
param planId string

resource webApplication 'Microsoft.Web/sites@2023-12-01' = {
  name: 'wb${namePrefix}'
  location: location

  properties: {
    serverFarmId: planId
    httpsOnly: true
  }
}

output siteUrl string = webApplication.properties.hostNames[0]
