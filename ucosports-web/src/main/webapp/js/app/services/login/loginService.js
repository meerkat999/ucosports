define(['app-module'], function (app) {
    app.factory('loginService',['$resource', '$q', '$location', function ($resource, $q, $location) {

        var baseUrl = $location.protocol() + "://" + $location.host() + ":8180/auth/realms/UCOSPORTS/protocol/openid-connect";

        var services = {
          login : login,
          logout : logout
        }

        function login(params){
          return $resource(baseUrl + "/token", {}, {
              send: {
                  method: 'POST',
                  headers: {
                      'Content-Type': 'application/x-www-form-urlencoded'
                  }
              }
          }).send(params).$promise;
        }

        function logout(){
          return $resource(baseUrl + "/logout", {}, {
              send: {
                  method: 'GET'
              }
          }).send().$promise;
        }

        return services;

    }]);

});
