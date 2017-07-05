define(['app-module', 'restService'], function (app) {
    app.factory('acompananteService',['restService', '$q', function (restService, $q) {

      var path = 'acompananteService/'

        var servicesRest = {
          addAfterCheckin : function(acompanante){
            return restService.POST(path + 'addAfterCheckin', acompanante);
          },
          searchAcompananteCheckInActive : function(acompanante){
            return restService.POST(path + 'searchAcompananteCheckInActive', acompanante);
          }
        }

        return servicesRest;

    }]);
});
