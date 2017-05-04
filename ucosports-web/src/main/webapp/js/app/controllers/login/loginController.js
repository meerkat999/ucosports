define(['app-module', 'loginService'], function (app) {
    app.controller('loginController',['$scope','$state', 'loginService', '$httpParamSerializer', '$http',
    function ($scope, $state, loginService, $httpParamSerializer, $http) {

    	$scope.login = function(){
          var params = $httpParamSerializer({username: $scope.user, password: $scope.pass, client_id: "ucosports-web", grant_type: "password"});
    	    loginService.send(params).$promise.then(
            function(result){
              $http.defaults.headers.post['Content-Type'] =  'application/json';
              $http.defaults.headers.common['Authorization'] =  'Bearer ' + result.access_token;
              $state.go("app");
            },
            function(deny){
              $http.defaults.headers.common['Authorization'] =  'Bearer ' + "noToken";
              console.log("Contraseña Incorrecta");
            }
          );
        };
    }]);
});
