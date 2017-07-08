define(['app-module', 'restService'], function (app) {
    app.factory('mediopagoService',['restService', '$q', function (restService, $q) {

      var path = 'medioPagoService/'

        var servicesRest = {
          getAll : function(){
            return restService.GETArray(path + 'getAll');
          }
        }

        return servicesRest;

    }]);
});
