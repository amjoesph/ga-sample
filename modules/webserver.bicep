param namePrefix string
param location string = resourceGroup().location
param sku string = 'B1'
param planId string


param dockerImage string = ''
param dockerImageTag string = ''


resource webApplication 'Microsoft.Web/sites@2023-12-01' = {
  name: '${namePrefix}ng'
  location: location
  tags: {
    'hidden-related:${resourceGroup().id}/providers/Microsoft.Web/serverfarms/appServicePlan': 'Resource'
  }
  properties: {
    serverFarmId: planId

    siteConfig: {
      appSettings: [
        {
          name: 'DOCKER_REGISTRY_SERVICE_URL'
          value: 'https://index.docker.io'
        }
        {
          name: 'DOCKER_REGISTRY_SERVER_USERNAME'
          value: ''
        }
        {
          name: 'DOCKER_REGISTRY_SERVER_PASSWORD'
          value: ''
        }
        {
          name: 'WEBSITED_ENABLE_APPSERVICE_STORAGE'
          value: 'false'
        }
      ]
      linuxFxVersion:'DOCKER|${dockerImage}:${dockerImageTag}'
    }
  }
}

output ngurl string = webApplication.properties.hostNames[0]
