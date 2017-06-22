define(['app-module', 'restService'], function (app) {
    app.factory('sportService',['restService', function (restService) {

      var path = 'sportService/'

        var servicesRest = {
          save : function(sport){
            return restService.POST(path + 'save', sport);
          },
          update : function(sport){
            return restService.POST(path + 'update', sport);
          },
          getAll : function(){
            return restService.GETArray(path + 'getAll');
          }
        }

        return servicesRest;

    }]);
});
