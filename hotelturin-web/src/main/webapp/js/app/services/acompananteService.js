define(['app-module', 'restService'], function (app) {
    app.factory('acompananteService',['restService', '$q', function (restService, $q) {

      var path = 'acompananteService/'

        var servicesRest = {
          add : function(acompanante){
            return restService.POST(path + 'add', acompanante);
          }
        }

        return servicesRest;

    }]);
});
