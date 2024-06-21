
param namePrefix string = 'shop2'
param location string = resourceGroup().location
param storageName string = 'sstore3'

module storage 'modules/storage.bicep' = {
  name: '${namePrefix}${storageName}'
  params: {
    storageName: storageName
    location:location
  }
}
