define(['app-module', 'sweetService', 'clienteService', 'tipoDocumentoService'], function (app) {
    app.controller('clienteController',['$scope','$state', 'sweetService', 'clienteService', 'tipoDocumentoService',
        function ($scope, $state, sweetService, clienteService, tipoDocumentoService) {

      $scope.listClientes = [];
      $scope.listaTiposDocumentos = [];
      $scope.nuevoCliente = {
        id : {}
      };

      $scope.agregar = function(){
        clienteService.add($scope.nuevoCliente).then(function(data){
          if(data !== null){
            sweetService.success("Cliente " + data.nombreCompleto + " registrado a las: " + new Date(data.fechaRegistro));
            $state.reload();
          }
        },function(error){
          sweetService.error("Ha ocurrido un error al intentar añadir al cliente. Si el problema persiste, comúniquese con el área de sistemas.");
        })
      }

      $scope.registrar = function(){
        clienteService.getById($scope.nuevoCliente.id).then(function(cliente){
          if(cliente.id !== undefined){
            sweetService.warning("Ya existe un cliente con esa identificación.");
          }else {
            $scope.agregar();
          }
        })
      }

      $scope.obtenerClientes = function(){
        clienteService.getAll().then(function (data){
          if(data !== null){
            $scope.listClientes = data;
          }else{
            sweetService.warning("Sin información.");
          }
        }, function(error){
          sweetService.error("No se pudieron obtener los clientes");
        })
      }

      $scope.init = function(){
        tipoDocumentoService.getAll().then(function(lista){
          if(lista !== null && lista !== undefined){
            $scope.listaTiposDocumentos = lista;
          }
        }, function(error){
          sweetService.error("No se pudieron obtener los tipos de documento.");
        })
        $scope.obtenerClientes();
      }

      $scope.init();

    }]);
});
