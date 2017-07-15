define(['app-module', 'restService'], function (app) {
    app.factory('consumoporservicioService',['restService', '$q', function (restService, $q) {

      var path = 'consumoporservicioService/'

        var servicesRest = {
          addorupdate : function(acompanante){
            return restService.POST(path + 'addorupdate', acompanante);
          }
        }

        return servicesRest;

    }]);
});
