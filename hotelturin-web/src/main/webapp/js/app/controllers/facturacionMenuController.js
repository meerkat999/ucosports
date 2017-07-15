define(['app-module'], function (app) {
    app.controller('facturacionMenuController',['$scope','$state',
     function ($scope, $state) {

      $scope.goFacturaHospedaje = function(){
        $state.go("app.facturacion.hospedajes")
      }

      $scope.goFacturaServiciosAdicionales = function(){
        $state.go("app.facturacion.serviciosAdicionales")
      }


      $scope.init = function(){

      }

      $scope.init();

    }]);
});
