define(['app-module', 'restService'], function (app) {
    app.factory('arriendoService',['restService', '$q', function (restService, $q) {

      var path = 'arriendoService/'

        var servicesRest = {
          add : function(arriendo){
            return restService.POST(path + 'add', arriendo);
          },
          getByClienteKeyCheckInActive : function(clienteId){
            return restService.POST(path + 'getByClienteKeyCheckInActive', clienteId);
          },
          getByState : function(arriendo){
            return restService.POST(path + 'getByState', arriendo);
          },
          checkOut : function(arriendo){
            return restService.POST(path + 'checkOut', arriendo);
          },
          getById : function(arriendo){
            return restService.POST(path + 'getById', arriendo);
          },
          getArriendosActivosConEspacio : function(){
            return restService.GETArray(path + 'getArriendosActivosConEspacio');
          },
          getByStateAndNoHaveFactura : function(){
            return restService.GETArray(path + 'getByStateAndNoHaveFactura');
          }
        }

        return servicesRest;

    }]);
});
