define(['app-module', 'sweetService', 'clienteService'], function (app) {
    app.controller('clienteController',['$scope','$state', 'sweetService', 'clienteService',
        function ($scope, $state, sweetService, clienteService) {

      $scope.listClientes = [];
      $scope.nuevoCliente = {
        id : {}
      };

      $scope.agregar = function(){
        clienteService.add($scope.nuevoCliente).then(function(data){
          if(data !== null){
            sweetService.success("Cliente " + data.nombreCompleto + " registrado a las: " + new Date(data.fechaRegistro));
            $scope.obtenerClientes();
          }
        },function(error){
          sweetService.error(error);
        })
      }

      $scope.registrar = function(){
        clienteService.getById($scope.nuevoCliente.id).then(function(data){
          if(data !== null){

            sweetService.warning(angular.toJson(data));
          }else{
            $scope.agregar();
          }
        }, function(error){
          sweetService.error(error);
        });


      }

      $scope.obtenerClientes = function(){
        clienteService.getAll().then(function (data){
          if(data !== null){
            $scope.listClientes = data;
          }else{
            sweetService.warning("Sin información.");
          }
        }, function(error){
          sweetService.error(error);
        })
      }

      $scope.init = function(){
        sweetService.success("Vamos a registrar un cliente.");
        $scope.obtenerClientes();
      }

      $scope.init();

    }]);
});
