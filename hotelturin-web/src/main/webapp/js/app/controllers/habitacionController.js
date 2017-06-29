define(['app-module', 'sweetService', 'habitacionService'], function (app) {
    app.controller('habitacionController',['$scope','$state', 'sweetService', 'habitacionService',
        function ($scope, $state, sweetService, habitacionService) {

      $scope.agregar = function(){
          habitacionService.add($scope.Habitacion).then(function(data){
            if(data !== null){
          	   sweetService.success("La Habitacion " + data.id + " fue registrada satisfactoriamente");
          	 $state.go("app.administracion.adminHabitaciones")
            }
          },function(error){
            sweetService.error("Ha ocurrido un error al intentar Registrar la  habitacion. Si el problema persiste, comúniquese con el área de sistemas.");
          })
      }

      $scope.campoVacio = function(campo){
          return campo == undefined || campo == "";
      }

      $scope.validarFormularioRegistro = function(){
        var valido = true;
        $scope.erroresFormularioRegistro = [];
        if($scope.campoVacio($scope.Habitacion.id)){
          valido = false;
          $scope.erroresFormularioRegistro[0] = true;
        }else if($scope.campoVacio($scope.Habitacion.nombre)){
          valido = false;
          $scope.erroresFormularioRegistro[1] = true;
        }else if($scope.campoVacio($scope.Habitacion.capacidad)){
          valido = false;
          $scope.erroresFormularioRegistro[2] = true;
        }else if($scope.campoVacio($scope.Habitacion.descripcion)){
          valido = false;
          $scope.erroresFormularioRegistro[3] = true;
        }else if($scope.campoVacio($scope.Habitacion.precio)){
          valido = false;
          $scope.erroresFormularioRegistro[4] = true;
        }
        return valido;
      }
     
      
      $scope.buscarHabitacionesDisponibles = function(){
          var estado = {
            id : 1
          }
          habitacionService.getByState(estado).then(function(data){
            if(data !== null && data.listaHabitaciones !== null){
              $scope.habitacionesDisponibles = data.listaHabitaciones;             
            }
          })
        }
      
      $scope.buscarHabitacionesOcupadas = function(){
          var estado = {
            id : 3
          }
          habitacionService.getByState(estado).then(function(data){
            if(data !== null && data.listaHabitaciones !== null){
              $scope.habitacionesOcupadas = data.listaHabitaciones;             
            }
          })
        }

      $scope.buscarHabitacionesInactivas = function(){
          var estado = {
            id : 2
          }
          habitacionService.getByState(estado).then(function(data){
            if(data !== null && data.listaHabitaciones !== null){
              $scope.habitacionesInactivas = data.listaHabitaciones;             
            }
          })
        }
      $scope.registrar = function(){
        if($scope.validarFormularioRegistro() == true){
          habitacionService.getById($scope.Habitacion).then(function(habitacion){
            if(habitacion.id !== undefined){
              sweetService.warning("Ya existe una Habitacion con ese número.");
            }else{
              $scope.agregar();
            }
          });
        }
      }
      $scope.actualizar = function(){
          habitacionService.update($scope.Habitacion).then(function(data){
            if(data !== null){
          	   sweetService.success("La Habitacion  " + data.id + " fue editada satisfactoriamente");
          	  $state.go('app.administracion.adminHabitaciones.modificarHabitaciones')        	  
            }
          },function(error){
            sweetService.error("Ha ocurrido un error al intentar Actualizar la Habitacion. Si el problema persiste, comúniquese con el área de sistemas.");
          })
      }
      
      $scope.desactivar = function(habitacion){
          habitacionService.desactivar(habitacion).then(function(data){
            if(data !== null){
          	   sweetService.success("La Habitacion  " + data.id + " fue desactivada satisfactoriamente");
          	 $scope.buscarHabitacionesDisponibles();
          	 $scope.$apply();
            }
          },function(error){
            sweetService.error("Ha ocurrido un error al intentar Desactivar la Habitacion. Si el problema persiste, comúniquese con el área de sistemas.");
          })      
      }   
      
      $scope.activar = function(habitacion){
          habitacionService.activar(habitacion).then(function(data){
            if(data !== null){
          	   sweetService.success("La Habitacion " + data.id + " fue Activada satisfactoriamente");
          	 $scope.buscarHabitacionesInactivas();
          	 $scope.$apply();
            }
          },function(error){
            sweetService.error("Ha ocurrido un error al intentar Activar la Habitacion. Si el problema persiste, comúniquese con el área de sistemas.");
          })      
      }
      
      $scope.buscarhabitaciones = function(){          
    	  habitacionService.getAll().then(function(lista){
              if(lista !== null && lista !== undefined){
                $scope.listHabitaciones = lista;
              }
            }, function(error){
              sweetService.error("No se pudieron obtener las Habitaciones.");
            })
          }
     
      $scope.goRegistrarHabitacion = function(){
          $scope.init();
          $scope.Habitacion={};
          $state.go("app.administracion.adminHabitaciones.registrarHabitacion")
        }
      
      $scope.goModificarHabitacion = function(){
          $scope.init();
          $state.go("app.administracion.adminHabitaciones.modificarHabitaciones")
        }
        
        $scope.goActivarHabitacion = function(){
            $scope.init();
            $state.go("app.administracion.adminHabitaciones.activarHabitaciones")
          }
        
        $scope.goEditar = function(habitacion){
          $scope.Habitacion = habitacion;
          $scope.isEditing = true;
          $state.go("app.administracion.adminHabitaciones.modificarHabitaciones.editarHabitaciones")
        }
    
      $scope.init = function(){
    	$scope.buscarhabitaciones();
    	$scope.isEditing = false;
    	$scope.buscarHabitacionesDisponibles();
    	$scope.buscarHabitacionesInactivas();
    	$scope.buscarHabitacionesOcupadas();
        $scope.listHabitaciones = [];
        $scope.habitacionesDisponibles = [];
        $scope.habitacionesInactivas = [];
        $scope.habitacionesOcupadas = [];
        $scope.Habitacion={};
                      
      }

      $scope.init();

    }]);
});
