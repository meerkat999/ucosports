define(['app-module'], function (app) {
    app.factory('restService',['$resource', '$q', '$location', function ($resource, $q, $location) {

        var baseUrl = $location.protocol() + "://" + location.host + ":8082/rest/";

        var restMethods = {
          post : {
            'post' : {
              method : 'POST',
              transformRequest: function (params) {return angular.toJson(params);}
            }
          },
          getArray : {
            'get' : {
              method : 'GET',
              isArray: true
            },
          }
        }

        var methods = {
          post : function(path, params){
            console.log(angular.toJson(params));
            return $resource(baseUrl   + path, {}, restMethods.post).post().$promise;
          },
          getArray : function(path, params){
            return $resource(baseUrl   + path, params, restMethods.getArray).get().$promise;
          }
        }



        return methods;

    }]);

});
