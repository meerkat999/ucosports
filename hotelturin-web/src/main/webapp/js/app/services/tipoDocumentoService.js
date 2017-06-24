define(['app-module', 'restService'], function (app) {
    app.factory('tipoDocumentoService',['restService', '$q', function (restService, $q) {

      var path = 'tipoDocumentoService/'

        var servicesRest = {
          getAll : function(){
            return restService.GETArray(path + 'getAll');
          }
        }

        return servicesRest;

    }]);
});
