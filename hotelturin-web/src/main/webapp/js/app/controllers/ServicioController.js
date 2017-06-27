define(['app-module', 'sweetService', 'servicioService'], function (app) {
    app.controller('habitacionController',['$scope','$state', 'sweetService', 'servicioService',
        function ($scope, $state, sweetService, servicioService) {

      $scope.agregar = function(){
          servicioService.add($scope.Habitacion).then(function(data){
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
        }else if($scope.campoVacio($scope.Servicio.precio)){
          valido = false;
          $scope.erroresFormularioRegistro[1] = true;           
        }
        return valido;
      }


      $scope.registrar = function(){
        if($scope.validarFormularioRegistro() == true){
              $scope.agregar();
            }
         
        }
     
      $scope.init = function(){
        $scope.listServicios = [];
        $scope.Servicio={};
      }

      $scope.init();

    }]);
});
