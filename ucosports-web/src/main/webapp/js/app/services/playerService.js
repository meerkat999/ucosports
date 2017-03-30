define(['app-module', 'restService'], function (app) {
    app.factory('playerService',['restService', function (restService) {

        var methods = {
          getAll : function(){
            return restService.getArray('/rest/playerService/getAll');
          },
          post : function(path){
            return null;
          }
        }

        return methods;

    }]);
});
