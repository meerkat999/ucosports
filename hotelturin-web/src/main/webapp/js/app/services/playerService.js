define(['app-module', 'restService'], function (app) {
    app.factory('playerService',['restService', function (restService) {

      var path = 'playerService/'

        var servicesRest = {
          getById : function(player){
            return restService.POST(path + 'getById', player);
          },
          getAll : function(){
            return restService.GETArray(path + 'getAll');
          },
          prueba : function(){
            return restService.GETArray(path + 'prueba');
          }
        }

        return servicesRest;

    }]);
});
