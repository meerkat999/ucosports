define(['app-module','clienteService', 'tipoDocumentoService', 'sweetService', 'habitacionService', 'arriendoService', 'acompananteService'], function (app) {
    app.controller('checkinController',['$scope','$state', 'clienteService', 'tipoDocumentoService',
    'sweetService', 'habitacionService', '$filter', 'arriendoService','acompananteService',
    function ($scope, $state, clienteService, tipoDocumentoService, sweetService, habitacionService, $filter, arriendoService, acompananteService) {

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
              arriendoService.getByClienteKeyCheckInActive(cliente.id).then(function(arriendo){
                if(arriendo !== undefined && arriendo.id !== undefined){
                  sweetService.warning("No puedes continuar con el proceso porque el cliente tiene un checkin activo.");
                }else{
                  var verifyAcompanante = {
                    cedulaId : cliente.id.id,
                    tipoDocumentoId : cliente.id.tipodocumento
                  }
                  acompananteService.searchAcompananteCheckInActive(verifyAcompanante).then(function(verify){
                    if(verify !== undefined && verify.id !== undefined){
                      sweetService.warning("No puedes continuar con el proceso porque el cliente ya está registrado como acompañante en un checkin activo.");
                    }else{
                      $scope.cliente = cliente;
                      sweetService.info("Cliente Registrado","El cliente " + cliente.nombreCompleto + " ya se encuentra registrado. \n Puedes continuar con el proceso.");
                      $scope.seBloqueanLosCamposDeCedula = true;
                    }
                  })
                }
              }, function(error){
                sweetService.error("Se ha producido un error al intentar validar el estado de checkin del cliente. Comuníquese con el área de sistemas.")
              })
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
              if($scope.currentState === "Nuevo"){
                $state.go("app.checkinMenu.nuevo.registro")
              }else{
                $state.go("app.checkinMenu.addAcompanante.registroAcompanante")
              }

            }
          });
        }
      }

      $scope.validarEnTiempoRealCamposCedulaAcompanante = function(){
        if(!$scope.campoVacio($scope.tipodocumentoAcompanante) &&
           !$scope.campoVacio($scope.cedulaVerificarAcompanante) &&
           !$scope.campoVacio($scope.confirmacionCedulaAcompanante) &&
           $scope.cedulaVerificarAcompanante === $scope.confirmacionCedulaAcompanante
        ){
          var id = {
            tipodocumento : $scope.tipodocumentoAcompanante,
            id : $scope.cedulaVerificarAcompanante
          };
          clienteService.getById(id).then(function(cliente){
            if(cliente.id !== undefined){
              if(cliente.id.id === $scope.cliente.id.id){
                sweetService.warning("No puedes añadir como acompañante al cliente principal.");
              }else{
                arriendoService.getByClienteKeyCheckInActive(cliente.id).then(function(arriendo){
                  if(arriendo !== undefined && arriendo.id !== undefined){
                    sweetService.warning("No puedes generar un checkin con un acompañante que ya tiene uno activo.");
                  }else{
                    if($scope.buscarIDenAcompanantes(cliente.id.id)){
                        sweetService.warning("El acompañante ya ha sido añadido.");
                    }else{
                      $scope.acompanante = cliente;
                      sweetService.info("Cliente Registrado","El cliente " + cliente.nombreCompleto + " ya se encuentra registrado. \n Ya puedes agregarlo como acompañante.");
                      $scope.seBloqueanLosCamposDeCedulaAcompanante = true;
                    }
                  }
                }, function(error){
                  sweetService.error("Se ha producido un error al intentar validar el estado de checkin del cliente. Comuníquese con el área de sistemas.")
                })
              }
            }else{
              sweetService.info("Cliente no Registrado","Se te habilitará un módulo para registrar el nuevo cliente.");
              $scope.esNecesarioRegistrarAcompanante = true;
              $scope.nuevoCliente = {
                id : {
                  id : $scope.cedulaVerificarAcompanante,
                  tipodocumento : $scope.tipodocumentoAcompanante
                }
              };
              $scope.seBloqueanLosCamposDeCedulaAcompanante = true;
              $state.go("app.checkinMenu.nuevo.registroAcompanante")
            }
          });
        }
      }

      $scope.buscarIDenAcompanantes = function(id){
        for (acompanante of $scope.acompanantes) {
          if(acompanante.id.id === id){
            return true;
          }
        }
        return false;
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
          if(habitacion.capacidad > $scope.numeroAcompanantes){
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
            if($scope.habitacionesDisponibles.length === 0 && $scope.currentState === "Nuevo"){
                $state.go("app.content");
                sweetService.warning("No quedan habitaciones disponibles para generar un check-in");
            }
          }
        })
      }

      $scope.openHabitacion = function(habitacion){
        sweetService.question(habitacion.id, habitacion.descripcion, "Seleccionar", "Cancelar", function(esSeleccionada){
          if(esSeleccionada){
            $scope.habitacionSeleccionada = habitacion;
            $scope.$apply();
          }
        });
      }

      $scope.setRegistarAcompanante = function(){
        $scope.registarAcompanante = true;
        $scope.acompanante = null;
        $scope.seBloqueanLosCamposDeCedulaAcompanante = false;
        $scope.tipodocumentoAcompanante = null;
        $scope.confirmacionCedulaAcompanante = null;
        $scope.cedulaVerificarAcompanante = null;
      }

      $scope.anadirAcompanante = function(){
        $scope.acompanantes.push($scope.acompanante);
        $scope.registarAcompanante = false;
      }

      $scope.mostrarVistaRegistroAcompanante = function(){
        return $scope.esNecesarioRegistrarAcompanante;
      }

      $scope.limpiarAcompanantes = function(){
        $scope.registarAcompanante = false;
        $scope.acompanante = null;
        $scope.seBloqueanLosCamposDeCedulaAcompanante = false;
        $scope.tipodocumentoAcompanante = null;
        $scope.confirmacionCedulaAcompanante = null;
        $scope.cedulaVerificarAcompanante = null;
        $scope.acompanantes = [];
        $scope.numeroAcompanantes = 0
      }

      $scope.cancelarAnadir = function(){
        $scope.registarAcompanante = false;
      }

      $scope.realizarCheckIn = function(){
        $scope.arriendo = {
          habitacionId : $scope.habitacionSeleccionada.id,
          clienteId : $scope.cliente.id.id,
          tipodocumentoId : $scope.cliente.id.tipodocumento,
          numeroNoches : $scope.numeroNoches,
          acompanantes : $scope.acompanantes
        }
        arriendoService.add($scope.arriendo).then(function(arriendo){
          if(arriendo !== null && arriendo.id !== null){
            $scope.arriendo = arriendo;
            $scope.arriendoFecha = $filter('date')(new Date(arriendo.dateCheckin), "yyyy/MM/dd 'a las' h:mma")
            var fecha = $filter('date')(new Date(arriendo.dateCheckin), "yyyy/MM/dd 'a las' h:mma");
            sweetService.success("El check-in se registró correctamente el "
              + fecha + ". \n Para el cliente " + $scope.cliente.nombreCompleto + " en la habitación " + $scope.habitacionSeleccionada.id + ".");
          }
        }, function(error){
          alert("Ha ocurrido un error creando el check-in. Inténtelo de nuevo o comuníquese con el área de sistemas");
          $scope.reset();
        })
      }

      $scope.finishCheckIn = function(){
        arriendoService.getByClienteKeyCheckInActive($scope.cliente.id).then(function(arriendo){
          if(arriendo !== undefined && arriendo.id !== undefined){
            sweetService.warning("No puedes generar un checkin a un cliente que ya tiene uno activo.");
          }else{
            if($scope.cliente === null || $scope.cliente.id.id === null || $scope.habitacionSeleccionada.id === null || $scope.numeroAcompanantes != $scope.acompanantes.length){
              sweetService.warning("Falta información para realizar el check-in.");
            }else{
              sweetService.question("Finalizar Check-in", "¿Está seguro que desea realizar el check-in?", "Realizar", "Cancelar",
                function(confirm){
                  if(confirm){
                    $scope.realizarCheckIn();
                  }
                })

            }
          }
        }, function(error){
          sweetService.error("Se ha producido un error al intentar validar el estado de checkin del cliente. Comuníquese con el área de sistemas.")
        })
      }

      $scope.getArriendosActivosConEspacio = function(){
        arriendoService.getArriendosActivosConEspacio().then(function(listaArriendosActivos){
          if(listaArriendosActivos !== undefined && listaArriendosActivos.length > 0){
            $scope.arriendoActivos = listaArriendosActivos;
          }else{
            sweetService.warning("No hay ningún check-in disponible para agregarle un acompañante.");
            $state.go("app.checkinMenu");
          }
        })
      }

      $scope.openArriendo = function(arriendo){
        $scope.arriendoSeleccionado = arriendo;
      }


      $scope.finishAddAcompanante = function(){
        if($scope.arriendoSeleccionado === undefined || $scope.arriendoSeleccionado.id === undefined){
          sweetService.warning("Selecciona por favor el hospejade al que se le agregará el acompañante.")
        }else{
          $scope.addAcompanante = {
            cedulaId : $scope.cliente.id.id,
            tipoDocumentoId : $scope.cliente.id.tipodocumento,
            arriendoId : $scope.arriendoSeleccionado.id
          }
          acompananteService.addAfterCheckin($scope.addAcompanante).then(function(acompanante){
            if(acompanante !== undefined && acompanante.id !== undefined){
              sweetService.success("El acompañante" + $scope.cliente.nombreCompleto + " se ha incluido correctamente en la habitación " + $scope.arriendoSeleccionado.habitacionId + ".",
              function(success){
                $scope.reset();
              })

            }else{
              sweetService.warning("No se ha podido añadir el acompanante. Inténtelo de nuevo en unos instantes.")
            }
          }, function(error){
            sweetService.error("Ha ocurrido un error al intentar añadir un acompañante. Comuníquese con el área de sistemas.")
          })
        }
      }


      $scope.reset = function(){
        $scope.buscarTiposDocumento();
        $scope.buscarHabitacionesDisponibles();
        if($scope.currentState === "AddAcompanante"){
          $scope.getArriendosActivosConEspacio();
        }
        $scope.nuevoCliente = {
          id : {}
        };
        $scope.esNecesarioRegistrar = false;
        $scope.seBloqueanLosCamposDeCedula = false;
        $scope.tipodocumento = null;
        $scope.cedulaVerificar = null;
        $scope.confirmacionCedula = null;
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
        $scope.acompanantes = [];
        $scope.registarAcompanante = false;
        $scope.acompanante = null;
        $scope.seBloqueanLosCamposDeCedulaAcompanante = false;
        $scope.tipodocumentoAcompanante = null;
        $scope.confirmacionCedulaAcompanante = null;
        $scope.cedulaVerificarAcompanante = null;
        $scope.isprinting=false;
        $scope.arriendoSeleccionado = undefined;
      }

      $scope.init = function(){
        $scope.reset();
      }

      $scope.init();

    }]);
});
