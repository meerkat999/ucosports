define(['app-module'], function (app) {
    app.factory('restService',['$resource', '$q', '$location', function ($resource, $q, $location) {

        var baseUrl = $location.protocol() + "://" + location.host + ":8082";

        var methods = {
          getArray : function(path, params){
            return $resource(baseUrl   + path, params, {'get' : {method : 'GET', isArray: true}}).get().$promise;
          },
          post : function(path){
            return null;
          }
        }

        return methods;

    }]);

});
