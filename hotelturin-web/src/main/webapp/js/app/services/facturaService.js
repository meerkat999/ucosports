define(['app-module', 'restService'], function (app) {
    app.factory('facturaService',['restService', '$q', function (restService, $q) {

      var path = 'facturaService/'

        var servicesRest = {
          facturarconsumoclientesincheckin : function(factura){
            return restService.POST(path + 'facturarconsumoclientesincheckin', factura);
          }
        }

        return servicesRest;

    }]);
});
