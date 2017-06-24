define(['app-module','clienteService', 'tipoDocumentoService', 'sweetService'], function (app) {
    app.controller('checkinController',['$scope','$state', 'clienteService', 'tipoDocumentoService', 'sweetService',
    function ($scope, $state, clienteService, tipoDocumentoService, sweetService) {

      $scope.esNecesarioRegistrar = false;

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
              sweetService.info("Cliente Registrado","El cliente " + cliente.nombreCompleto + " ya se encuentra registrado. \n Puedes continuar con el proceso de check-in.");
            }else{
              sweetService.info("Cliente no Registrado","Se te habiitará un módulo para registrar el nuevo cliente.");
              $scope.esNecesarioRegistrar = true;
            }
          });
        }
      }

      $scope.init = function(){
        tipoDocumentoService.getAll().then(function(lista){
          if(lista !== null && lista !== undefined){
            $scope.listaTiposDocumentos = lista;
          }
        }, function(error){
          sweetService.error("No se pudieron obtener los tipos de documento.");
        })
      }

      $scope.init();

    }]);
});
