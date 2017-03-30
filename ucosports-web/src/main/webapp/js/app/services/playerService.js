define(['app-module', 'restService'], function (app) {
    app.factory('playerService',['restService', function (restService) {

      var path = 'playerService/'

        var methods = {
          getById : function(player){
            return restService.post(path + 'getById', player);
          },
          getAll : function(){
            return restService.getArray(path + 'getAll');
          },
          prueba : function(){
            return restService.getArray(path + 'prueba');
          },
          post : function(){
            return null;
          }
        }

        return methods;

    }]);
});
