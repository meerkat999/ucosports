define(['app-module', 'restService'], function (app) {
    app.factory('habitacionService',['restService', '$q', function (restService, $q) {

      var path = 'habitacionService/'

        var servicesRest = {
          getById : function(id){
            return restService.POST(path + 'getById', id);
          },
          getAll : function(){
            return restService.GETArray(path + 'getAll');
          },
          getByState : function(filtro){
              return restService.POST(path + 'getByState',filtro);
            },
          add : function(habitacion){
            return restService.POST(path + 'add', habitacion);
          },
            activar : function(habitacion){
                return restService.POST(path + 'activar', habitacion);
              }  
        }

        return servicesRest;

    }]);
});
