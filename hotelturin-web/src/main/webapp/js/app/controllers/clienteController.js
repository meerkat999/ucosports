define(['app-module', 'sweetService', 'clienteService', 'tipoDocumentoService'], function (app) {
    app.controller('clienteController',['$scope','$state', 'sweetService', 'clienteService', 'tipoDocumentoService', '$filter', '$rootScope',
        function ($scope, $state, sweetService, clienteService, tipoDocumentoService, $filter, $rootScope) {

      $scope.funcionesExternas = function() {
        if($scope.checkin == true && $scope.currentState === "Nuevo"){
          if($scope.registarAcompanante == true){
            $scope.$parent.acompanantes.push($scope.cliente);
            $scope.$parent.registarAcompanante = false;
          }else{
            $scope.$parent.$parent.cliente = $scope.cliente;
          }
          $state.go("app.checkinMenu.nuevo");
        }else if($scope.checkin == true && $scope.currentState === "AddAcompanante"){
          $scope.$parent.$parent.cliente = $scope.cliente;
        }else if($scope.serviciosAdicionalesRegistro === true){
          $scope.$parent.$parent.cliente = $scope.cliente;
          $state.go("app.serviciosAdicionales");
        }
      }

      $scope.agregar = function(){
        clienteService.add($scope.nuevoCliente).then(function(data){
          if(data !== null){
            var fecha = $filter('date')(new Date(data.fechaRegistro), "yyyy/MM/dd 'a las' h:mma")
            sweetService.success("Cliente " + data.nombreCompleto + " fue registrado satisfactoriamente en la fecha " + fecha);
            $scope.cliente = data;
            $scope.funcionesExternas();
          }
        },function(error){
          sweetService.error("Ha ocurrido un error al intentar añadir al cliente. Si el problema persiste, comúniquese con el área de sistemas.");
        })
      }

      $scope.campoVacio = function(campo){
        return campo == undefined || campo == "";
      }

      $scope.validarFormularioRegistro = function(){
        var valido = true;
        $scope.erroresFormularioRegistro = [];
        if($scope.campoVacio($scope.nuevoCliente.id.tipodocumento)){
          valido = false;
          $scope.erroresFormularioRegistro[0] = true;
        }else if($scope.campoVacio($scope.nuevoCliente.id.id)){
          valido = false;
          $scope.erroresFormularioRegistro[1] = true;
        }else if($scope.confirmacionCedulaAcompanante == undefined && $scope.nuevoCliente.id.id !== $scope.confirmacionCedula){
          valido = false;
          $scope.erroresFormularioRegistro[2] = true;
        }else if($scope.confirmacionCedulaAcompanante && $scope.nuevoCliente.id.id !== $scope.confirmacionCedulaAcompanante){
          valido = false;
          $scope.erroresFormularioRegistro[2] = true;
        }else if($scope.campoVacio($scope.nuevoCliente.nombreUno)){
          valido = false;
          $scope.erroresFormularioRegistro[3] = true;
        }else if($scope.campoVacio($scope.nuevoCliente.apellidoUno)){
          valido = false;
          $scope.erroresFormularioRegistro[4] = true;
        }else if($scope.campoVacio($scope.nuevoCliente.celular)){
          valido = false;
          $scope.erroresFormularioRegistro[5] = true;
        };
        return valido;
      }

      $scope.buscarCedulaRegistrada = function(){
        var resultado = false;
        clienteService.getById($scope.nuevoCliente.id).then(function(cliente){
          if(cliente.id !== undefined){
            resultado = true;
          }
        });
        return resultado;
      }

      $scope.validarEnTiempoRealCamposCedula = function(){
        if(!$scope.campoVacio($scope.nuevoCliente.id.id) &&
           !$scope.campoVacio($scope.nuevoCliente.id.tipodocumento) &&
           !$scope.campoVacio($scope.confirmacionCedula) &&
           $scope.nuevoCliente.id.id === $scope.confirmacionCedula
        ){
          clienteService.getById($scope.nuevoCliente.id).then(function(cliente){
            if(cliente.id !== undefined){
              sweetService.warning("Ya existe un usuario registrado con ese número de identificación.");
            }
          });
        }
      }

      $scope.registrar = function(){
        if($scope.validarFormularioRegistro() == true){
          clienteService.getById($scope.nuevoCliente.id).then(function(cliente){
            if(cliente.id !== undefined){
              sweetService.warning("Ya existe un usuario registrado con ese número de identificación.");
            }else{
              $scope.agregar();
            }
          });
        }
      }

      $scope.obtenerTipoDocumentos = function(){
        tipoDocumentoService.getAll().then(function(lista){
          if(lista !== null && lista !== undefined){
            $scope.listaTiposDocumentos = lista;
          }
        }, function(error){
          sweetService.error("No se pudieron obtener los tipos de documento.");
        })
      }

      $scope.yearChange = function(){
        if($scope.exportarDate != undefined){
          $scope.$parent.getMonthsWithClients($scope.exportarDate);
          return false;
        }
        return true;
      }

      $scope.init = function(){
        $scope.listClientes = [];
        $scope.listaTiposDocumentos = [];
        if($scope.nuevoCliente === null){
          $scope.nuevoCliente = {
            id : {}
          };
        }
        $scope.obtenerTipoDocumentos();
      }

      $scope.init();

    }]);
});
