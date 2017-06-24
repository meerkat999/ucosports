define(['app-module', 'sweetService', 'clienteService', 'tipoDocumentoService'], function (app) {
    app.controller('clienteController',['$scope','$state', 'sweetService', 'clienteService', 'tipoDocumentoService', '$filter',
        function ($scope, $state, sweetService, clienteService, tipoDocumentoService, $filter) {

      $scope.listClientes = [];
      $scope.listaTiposDocumentos = [];
      $scope.nuevoCliente = {
        id : {}
      };

      $scope.agregar = function(){
        clienteService.add($scope.nuevoCliente).then(function(data){
          if(data !== null){
            var fecha = $filter('date')(new Date(data.fechaRegistro), "yyyy/MM/dd 'a las' h:mma")
            sweetService.success("Cliente " + data.nombreCompleto + " fue registrado satisfactoriamente en la fecha " + fecha);
            $state.reload();
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
        }else if($scope.nuevoCliente.id.id !== $scope.confirmacionCedula){
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
