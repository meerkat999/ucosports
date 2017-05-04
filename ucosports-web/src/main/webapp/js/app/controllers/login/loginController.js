define(['app-module', 'loginService', 'sweetService'], function (app) {
    app.controller('loginController',['$scope','$state', 'loginService', '$httpParamSerializer', '$http', 'sweetService',
    function ($scope, $state, loginService, $httpParamSerializer, $http, sweetService) {

    	$scope.login = function(){
          var params = $httpParamSerializer({username: $scope.user, password: $scope.pass, client_id: "ucosports-web", grant_type: "password"});
          loginService.login(params).then(
            function(result){
              $http.defaults.headers.post['Content-Type'] =  'application/json';
              $http.defaults.headers.common['Authorization'] =  'Bearer ' + result.access_token;
              $state.go("app");
            },
            function(deny){
              $http.defaults.headers.common['Authorization'] =  'Bearer ' + "noToken";
              sweetService.warning("¡Contraseña Incorrecta!")
            }
          );
        };
    }]);
});
