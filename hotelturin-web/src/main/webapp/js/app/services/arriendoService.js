define(['app-module', 'restService'], function (app) {
    app.factory('arriendoService',['restService', '$q', function (restService, $q) {

      var path = 'arriendoService/'

        var servicesRest = {
          add : function(arriendo){
            return restService.POST(path + 'add', arriendo);
          }
        }

        return servicesRest;

    }]);
});
