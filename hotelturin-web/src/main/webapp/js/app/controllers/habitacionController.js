define(['app-module', 'sweetService', 'habitacionService'], function (app) {
    app.controller('habitacionController',['$scope','$state', 'sweetService', 'habitacionService',
        function ($scope, $state, sweetService, habitacionService) {

      $scope.agregar = function(){
          habitacionService.add($scope.Habitacion).then(function(data){
            if(data !== null){
          	   sweetService.success("La Habitacion " + data.id + " fue registrada satisfactoriamente");
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

      $scope.llenarFormularioRegistro = function(){
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
      
      $scope.buscarhabitaciones = function(){          
    	  habitacionService.getAll().then(function(lista){
              if(lista !== null && lista !== undefined){
                $scope.listHabitaciones = lista;
              }
            }, function(error){
              sweetService.error("No se pudieron obtener las Habitaciones.");
            })
          }
      $scope.edit = function(Habitacion){          
    	 
          }
    
      $scope.init = function(){
    	$scope.buscarhabitaciones();    
        $scope.listHabitaciones = [];
        $scope.Habitacion={};
                      
      }

      $scope.init();

    }]);
});
