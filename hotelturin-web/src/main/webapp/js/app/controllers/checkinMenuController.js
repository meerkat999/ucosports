define(['app-module'], function (app) {
    app.controller('checkinMenuController',['$scope','$state',
     function ($scope, $state, clienteService,habitacionService,servicioService) {

      $scope.goNuevoCheckIn = function(){
        $scope.currentState = "Nuevo";
        $state.go("app.checkinMenu.nuevo")
      }

      $scope.goAgregarAcompanante = function(){
        $scope.currentState = "AddAcompanante";
        $state.go("app.checkinMenu.addAcompanante")
      }


      $scope.init = function(){

      }

      $scope.init();

    }]);
});
