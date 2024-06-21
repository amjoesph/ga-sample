
param namePrefix string = 'shop4'
param location string = resourceGroup().location
param storageName string = 'sstore5'

module storage 'modules/storage.bicep' = {
  name: '${namePrefix}${storageName}'
  params: {
    storageName: storageName
    location:location
  }
}
