define(['app-module', 'restService'], function (app) {
    app.factory('facturaService',['restService', '$q', function (restService, $q) {

      var path = 'facturaService/'

        var servicesRest = {
          facturarconsumoclientesincheckin : function(factura){
            return restService.POST(path + 'facturarconsumoclientesincheckin', factura);
          },
          facturarHospedaje : function(factura){
            return restService.POST(path + 'facturarHospedaje', factura);
          },
          facturarHospedajeAndCheckout : function(factura){
            return restService.POST(path + 'facturarHospedajeAndCheckout', factura);
          },
          getByArriendoAndClienteAndState : function(factura){
            return restService.POST(path + 'getByArriendoAndClienteAndState', factura);
          }
        }

        return servicesRest;

    }]);
});
