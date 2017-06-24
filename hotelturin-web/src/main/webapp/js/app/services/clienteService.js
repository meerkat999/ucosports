define(['app-module', 'restService'], function (app) {
    app.factory('clienteService',['restService', function (restService) {

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
          }
        }

        return servicesRest;

    }]);
});
