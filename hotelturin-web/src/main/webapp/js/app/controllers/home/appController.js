define(['app-module'], function (app) {
    app.controller('appController',['$scope','$state', function ($scope, $state) {

      $scope.goCheckin = function(){
        $state.go("app.checkin");
      }

      $scope.goRegistrarCliente = function(){
        $state.go("app.registrarCliente");
        $state.go("app.registrarCliente.listar");
      }

      $scope.init = function(){
      }

      $scope.init();

    }]);
});
