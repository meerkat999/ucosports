define(['app-module', 'sweetService', 'servicioService'], function (app) {
    app.controller('servicioController',['$scope','$state', 'sweetService', 'servicioService',
        function ($scope, $state, sweetService, servicioService) {

      $scope.agregar = function(){
          servicioService.add($scope.Servicio).then(function(data){
            if(data !== null){
          	   sweetService.success("El Servicio adicional " + data.nombre + " fue registrado satisfactoriamente");
          	 $state.go("app.administracion.adminServicios")
            }
          },function(error){
            sweetService.error("Ha ocurrido un error al intentar Registrar el Servicio adicional. Si el problema persiste, comúniquese con el área de sistemas.");
          })
      }

      $scope.actualizar = function(){
          servicioService.update($scope.Servicio).then(function(data){
            if(data !== null){
          	   sweetService.success("El Servicio adicional " + data.nombre + " fue editado satisfactoriamente");
          	           	  
            }
          },function(error){
            sweetService.error("Ha ocurrido un error al intentar Actualizar el Servicio adicional. Si el problema persiste, comúniquese con el área de sistemas.");
          })
      }
      
      $scope.desactivar = function(servicio){
          servicioService.desactivar(servicio).then(function(data){
            if(data !== null){
          	   sweetService.success("El Servicio adicional " + data.nombre + " fue desactivado satisfactoriamente");
          	 $scope.buscarServiciosDisponibles();
          	 $scope.$apply();
            }
          },function(error){
            sweetService.error("Ha ocurrido un error al intentar Desactivar el Servicio adicional. Si el problema persiste, comúniquese con el área de sistemas.");
          })      
      }   
      
      $scope.activar = function(servicio){
          servicioService.activar(servicio).then(function(data){
            if(data !== null){
          	   sweetService.success("El Servicio adicional " + data.nombre + " fue Activado satisfactoriamente");
          	 $scope.buscarServiciosInactivos();
          	 $scope.$apply();
            }
          },function(error){
            sweetService.error("Ha ocurrido un error al intentar Activar el Servicio adicional. Si el problema persiste, comúniquese con el área de sistemas.");
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

      $scope.buscarServiciosInactivos = function(){
          var estado = {
            id : 2
          }
          servicioService.getByState(estado).then(function(data){
            if(data !== null && data.listaServicios !== null){
              $scope.serviciosInactivos = data.listaServicios;
            }
          })
        }
      
      $scope.registrar = function(){
        if($scope.validarFormularioRegistro() == true){
              $scope.agregar();
            }

        }

        $scope.goRegistrarServicio = function(){
          $scope.init();
          $scope.Servicio={};
          $state.go("app.administracion.adminServicios.registrarServicio")
        }

        $scope.goModificarServicios = function(){
          $scope.init();
          $state.go("app.administracion.adminServicios.modificarServicios")
        }
        
        $scope.goActivarServicios = function(){
            $scope.init();
            $state.go("app.administracion.adminServicios.activarServicios")
          }
        
        $scope.goEditar = function(servicio){
          $scope.Servicio = servicio;
          $scope.isEditing = true;
          $state.go("app.administracion.adminServicios.modificarServicios.editarServicio")
        }
        	
               
      $scope.init = function(){
        $scope.buscarServiciosDisponibles();
        $scope.buscarServiciosInactivos();
        $scope.isEditing = false;
        $scope.listServicios = [];
        $scope.serviciosDisponibles = [];
        $scope.serviciosInactivos = [];
        $scope.servicioSeleccionado = {
            id : null
        };
      }

      $scope.init();

    }]);
});
