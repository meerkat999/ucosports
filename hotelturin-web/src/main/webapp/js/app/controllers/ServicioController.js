define(['app-module', 'sweetService', 'servicioService'], function (app) {
    app.controller('servicioController',['$scope','$state', 'sweetService', 'servicioService',
        function ($scope, $state, sweetService, servicioService) {

      $scope.agregar = function(){
          servicioService.add($scope.Servicio).then(function(data){
            if(data !== null){
          	   sweetService.success("El Servicio adicional " + data.nombre + " fue registrado satisfactoriamente");
            }
          },function(error){
            sweetService.error("Ha ocurrido un error al intentar Registrar el Servicio adicional. Si el problema persiste, comúniquese con el área de sistemas.");
          })
      }

      $scope.campoVacio = function(campo){
          return campo == undefined || campo == "";
      }

      $scope.validarFormularioRegistro = function(){
        var valido = true;
        $scope.erroresFormularioRegistro = [];
        if($scope.campoVacio($scope.Servicio.nombre)){
          valido = false;
          $scope.erroresFormularioRegistro[0] = true;
        }else if($scope.campoVacio($scope.Servicio.valor)){
          valido = false;
          $scope.erroresFormularioRegistro[1] = true;           
        }
        return valido;
      }

      $scope.openServicio = function(servicio){
          sweetService.question(servicio.nombre, servicio.valor, "Seleccionar", "Cancelar", function(esSeleccionado){
            if(esSeleccionado){
              $scope.servicioSeleccionado = servicio;
              $scope.$apply();
            }
          });
        }

      $scope.buscarServiciosDisponibles = function(){
          var estado = {
            id : 1
          }
          servicioService.getByState(estado).then(function(data){
            if(data !== null && data.listaServicios !== null){
              $scope.serviciosDisponibles = data.listaServicios;
            }
          })
        }
     
      $scope.registrar = function(){
        if($scope.validarFormularioRegistro() == true){
              $scope.agregar();
            }
         
        }
     
      $scope.init = function(){
        $scope.listServicios = [];
        $scope.serviciosDisponibles = [];        
        $scope.Servicio={};
        $scope.servicioSeleccionado = {
                id : null
              };
      }

      $scope.init();

    }]);
});
