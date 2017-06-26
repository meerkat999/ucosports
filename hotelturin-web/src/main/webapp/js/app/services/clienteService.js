define(['app-module', 'restService'], function (app) {
    app.factory('clienteService',['restService', '$q', function (restService, $q) {

      var path = 'clienteService/'

        var servicesRest = {
          getById : function(id){
            return restService.POST(path + 'getById', id);
          },
          getAll : function(){
            return restService.GETArray(path + 'getAll');
          },
          add : function(cliente){
            return restService.POST(path + 'add', cliente);
          },
          getMonthsWithClients : function(year){
            return restService.POST(path + 'getMonthsWithClients', year);
          },
          getYearsWithClients : function(){
            return restService.GETArray(path + 'getYearsWithClients');
          }
        }

        return servicesRest;

    }]);
});
