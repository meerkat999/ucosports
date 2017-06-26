define(['app-module','clienteService', 'tipoDocumentoService', 'sweetService', 'habitacionService'], function (app) {
    app.controller('checkinController',['$scope','$state', 'clienteService', 'tipoDocumentoService', 'sweetService', 'habitacionService', '$filter',
    function ($scope, $state, clienteService, tipoDocumentoService, sweetService, habitacionService, $filter) {

      $scope.campoVacio = function(campo){
        return campo == undefined || campo == "";
      }

      $scope.validarEnTiempoRealCamposCedula = function(){
        if(!$scope.campoVacio($scope.tipodocumento) &&
           !$scope.campoVacio($scope.cedulaVerificar) &&
           !$scope.campoVacio($scope.confirmacionCedula) &&
           $scope.cedulaVerificar === $scope.confirmacionCedula
        ){
          var id = {
            tipodocumento : $scope.tipodocumento,
            id : $scope.cedulaVerificar
          };
          clienteService.getById(id).then(function(cliente){
            if(cliente.id !== undefined){
              $scope.cliente = cliente;
              $scope.puedeHacerCheckin = true;
              sweetService.info("Cliente Registrado","El cliente " + cliente.nombreCompleto + " ya se encuentra registrado. \n Puedes continuar con el proceso de check-in.");
              $scope.seBloqueanLosCamposDeCedula = true;
            }else{
              sweetService.info("Cliente no Registrado","Se te habilitará un módulo para registrar el nuevo cliente.");
              $scope.esNecesarioRegistrar = true;
              $scope.nuevoCliente = {
                id : {
                  id : $scope.cedulaVerificar,
                  tipodocumento : $scope.tipodocumento
                }
              };
              $scope.seBloqueanLosCamposDeCedula = true;
              $state.go("app.checkin.registro")
            }
          });
        }
      }

      $scope.reset = function(){
        $scope.nuevoCliente = {
          id : {}
        };
        $scope.esNecesarioRegistrar = false;
        $scope.puedeHacerCheckin = false;
        $scope.seBloqueanLosCamposDeCedula = false;
        $scope.tipodocumento = null;
        $scope.cedulaVerificar = null;
        $scope.confirmacionCedula = null;
        $scope.clienteRegistrado = null;
        $scope.cliente = null;
        $scope.checkin = true;
        $scope.habitacionSeleccionada = {
          id : null
        };
        $scope.numeroAcompanantes = 0;
        $scope.habitacionesDisponibles = [];
        $scope.conoceElNumeroDeNoches = {
          value : "'NO'"
        };
        $scope.numeroNoches = 0;
      }

      $scope.buscarTiposDocumento = function(){
        tipoDocumentoService.getAll().then(function(lista){
          if(lista !== null && lista !== undefined){
            $scope.listaTiposDocumentos = lista;
          }
        }, function(error){
          sweetService.error("No se pudieron obtener los tipos de documento.");
        })
      }

      $scope.mostrarVistaRegistro = function(){
        return $scope.esNecesarioRegistrar && $scope.cliente === null;
      }

      $scope.mostrarVistaCheckIn = function(){
        return $scope.cliente !== null;
      }

      $scope.filtrarPorCapacidad = function(){
        return function(habitacion){
          if(habitacion.capacidad >= $scope.numeroAcompanantes){
            return true;
          }
          return false;
        }
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

      $scope.openHabitacion = function(habitacion){
        sweetService.question(habitacion.id, habitacion.descripcion, "Seleccionar", "Cancelar", function(esSeleccionada){
          if(esSeleccionada){
            $scope.habitacionSeleccionada.id = habitacion.id;
            $scope.$apply();
          }
        });
      }

      $scope.init = function(){
        $scope.reset();
        $scope.buscarTiposDocumento();
        $scope.buscarHabitacionesDisponibles();
      }

      $scope.init();

    }]);
});
