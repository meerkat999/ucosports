define(['app-module', 'arriendoService', 'sweetService'], function (app) {
    app.controller('facturacionHospedajeController',['$scope','$state', 'arriendoService', 'mediopagoService', 'sweetService',
     function ($scope, $state, arriendoService, mediopagoService, sweetService) {

     $scope.getArriendosActivos = function(){
       arriendoService.getByState({estadoId : 1}).then(function(listaArriendosActivos){
         if(listaArriendosActivos !== undefined && listaArriendosActivos.listaArriendos !== undefined && listaArriendosActivos.listaArriendos.length > 0){
           $scope.arriendoActivos = listaArriendosActivos.listaArriendos;
         }else{
           sweetService.warning("No hay ningún check-in activo.");
           $state.go("app.facturacion");
         }
       })
     }

     $scope.openArriendo = function(arriendo){
       if(arriendo.numeroNoches === 0){
         sweetService.warning("Este hospedaje no tiene un número de noches definido. \n La factura se debe de realizar en el check-out.")
       }else{
          $scope.arriendoSeleccionado = arriendo;
       }
     }

     $scope.buscarMediosPago = function(){
       mediopagoService.getAll().then(function(lista){
         if(lista != undefined && lista.length > 0){
           $scope.mediospago = lista;
           $scope.mediospagoseleccionados = [];
           //$scope.mediospagoseleccionados.push($scope.mediospago[0]);
         }
       })
     }

     $scope.addMedioPago = function(medioPago){
       if(medioPago === null || medioPago === undefined || medioPago.id === undefined){
         sweetService.warning("Debe seleccionar un medio de pago válido.");
       }else{
         $scope.mediospagoseleccionados.push(medioPago);
       }
     }

     $scope.deleteMedioPago = function(index){
       $scope.valoresMediosPago[index] = 0;
       $scope.updateMedioPago(index);
       $scope.mediospagoseleccionados.splice(index, 1);
     }

     $scope.yaFueAnadido = function(){
       return function(mediopago){
         if($scope.mediospagoseleccionados.indexOf(mediopago) > -1){
           return false;
         }
         return true;
       }
     }

     $scope.limpiarMedioPago = function(index){
       $scope.valoresMediosPago[index] = 0;
       $scope.mediospagoseleccionados[index].valor = 0;
       $scope.updateMedioPago(index);
     }

     $scope.completarMedioPago = function(index){
       $scope.valoresMediosPago[index] = $scope.totalMonto - $scope.mediosPagoMonto;
       $scope.mediospagoseleccionados[index].valor = $scope.totalMonto - $scope.mediosPagoMonto;
       $scope.updateMedioPago(index);
     }

     $scope.updateMedioPago = function(index){
       $scope.mediosPagoMonto = 0;
       var valorActual = parseInt($scope.valoresMediosPago[index]);
       if($scope.mediospagoseleccionados[index] !== null){
         $scope.mediospagoseleccionados[index].valor = isNaN(valorActual) ? 0 : valorActual;
         $scope.mediospagoseleccionados[index].numBauche = $scope.bauches[index];
         for (valor of $scope.valoresMediosPago) {
           $scope.mediosPagoMonto += valor === "" ? 0 : parseInt(valor);
         }
       }
     }

     $scope.validarMediosPago = function(){
       if($scope.totalMonto - $scope.mediosPagoMonto > 0){
         sweetService.warning("Los medios de pago no cubren el monto total a pagar.");
         return false;
       }
       for (medioPago of $scope.mediospagoseleccionados){
         if((medioPago.needBauche == true && medioPago.numBauche == undefined) ||
             (medioPago.needBauche == true && medioPago.numBauche == "")){
               sweetService.warning("Falta el número de bauche para el medio de pago " + medioPago.nombre + ".");
               return false;
             }
       }
       return true;
     }

     $scope.mostrarMediosPago = function(){
       return $scope.arriendoSeleccionado !== undefined;
     }

      $scope.init = function(){
        $scope.buscarMediosPago();
        $scope.getArriendosActivos();
        $scope.arriendoSeleccionado = undefined;
        $scope.mediospagoseleccionados = [];
        $scope.mediospago = [];
        $scope.bauches = [];
        $scope.valoresMediosPago = [];
      }

      $scope.init();

    }]);
});
