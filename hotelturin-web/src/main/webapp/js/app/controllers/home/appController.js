define(['app-module'], function (app) {
    app.controller('appController',['$scope','$state', function ($scope, $state) {

      $scope.goCheckinMenu = function(){
        $state.go("app.checkinMenu");
      }
      $scope.goAdministracion = function(){
        $state.go("app.administracion");
      }
      $scope.goCheckOut = function(){
        $state.go("app.checkout");
      }
      $scope.goServiciosAdicionales = function(){
        $state.go("app.serviciosAdicionales");
      }
      $scope.init = function(){
        $state.go("app.content");
      }

      $scope.init();

    }]);
});
