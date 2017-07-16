define(['app-module', 'arriendoService', 'sweetService', 'facturaService'], function (app) {
    app.controller('facturacionHospedajeController',['$scope','$state', 'arriendoService', 'mediopagoService', 'sweetService',
    'facturaService', '$filter',
     function ($scope, $state, arriendoService, mediopagoService, sweetService, facturaService, $filter) {

     $scope.getArriendosActivos = function(){
       arriendoService.getByStateAndNoHaveFactura().then(function(listaArriendosActivos){
         if(listaArriendosActivos !== undefined && listaArriendosActivos.length > 0){
           $scope.arriendoActivos = listaArriendosActivos;
           var prueba = $filter('filter')($scope.arriendoActivos, $scope.nochesDefinidas());
           if(prueba.length == 0){
             sweetService.warning("No hay ningún check-in activo o todos los check-ins con noches predefinidas ya están facturados.");
             $state.go("app.facturacion");
           }
         }else{
           sweetService.warning("No hay ningún check-in activo o todos los check-ins con noches predefinidas ya están facturados.");
           $state.go("app.facturacion");
         }
       })
     }

     $scope.openArriendo = function(arriendo){
       if(arriendo.numeroNoches === 0){
         sweetService.warning("Este hospedaje no tiene un número de noches definido. \n La factura se debe de realizar en el check-out.")
       }else{
          $scope.arriendoSeleccionado = arriendo;
          var saldo = arriendo.clienteConsumo === null ? 0 : arriendo.clienteConsumo.saldo === undefined ? 0 : arriendo.clienteConsumo.saldo;
          $scope.totalMonto = (arriendo.numeroNoches * arriendo.habitacion.precio) + saldo;
          $scope.date = new Date();
          $scope.calcularFechaSalida();
       }
     }

     $scope.calcularFechaSalida = function(){
       var fechaActual = new Date($scope.arriendoSeleccionado.dateCheckin);
       var hour = fechaActual.getHours();
       if(hour < 5){
         $scope.fechaSalida = fechaActual.setHours(12);
       }else{
         fechaActual.setTime(fechaActual.getTime() + ($scope.arriendoSeleccionado.numeroNoches * 24 * 60 * 60 * 1000));
         fechaActual = fechaActual.setHours(12);
         fechaActual = new Date(fechaActual);
         fechaActual = fechaActual.setMinutes(0);
         $scope.fechaSalida = fechaActual;
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
       $scope.mediosPagoMonto = $scope.mediosPagoMonto === undefined ? 0 : $scope.mediosPagoMonto;
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

     $scope.nochesDefinidas = function(){
       return function(arriendo){
         return arriendo.numeroNoches > 0;
       }
     }

     $scope.mostrarBotonFactura = function(){
       return $scope.arriendoSeleccionado !==  undefined && $scope.totalMonto - $scope.mediosPagoMonto <= 0;
     }

     $scope.finishFactura = function(){
       if($scope.validarMediosPago()){
         $scope.factura = {
           clienteId : $scope.arriendoSeleccionado.cliente.id.id,
           tipodocumentoId : $scope.arriendoSeleccionado.cliente.id.tipodocumento,
           arriendoId : $scope.arriendoSeleccionado.id,
           clienteconsumoId : $scope.arriendoSeleccionado.clienteConsumo !== null ? $scope.arriendoSeleccionado.clienteConsumo.id : null,
           habitacionId : $scope.arriendoSeleccionado.habitacion.id,
           fecha : $scope.date,
           listaMediosPago : $scope.mediospagoseleccionados,
           listaConsumoPorServicio : null
         }
         facturaService.facturarHospedaje($scope.factura).then(function(data){
           if(data !== undefined && data.id !== undefined){
             $scope.facturaResultante = data;
             sweetService.success("Se ha facturado correctamente.", function(success){
               $scope.print();
             });

           }else{
             sweetService.warning("No se ha podido generar la factura. Comuníquese con el área de sistemas.")
           }
         });
       }
     }

     $scope.print = function(){
       printElement(document.getElementById("printThis"));
       window.print();
       setTimeout(function () { $scope.init(); }, 100);
       $scope.init();
     }

     function printElement(elem) {
       $scope.isprinting=true;
         var domClone = elem.cloneNode(true);
         var $printSection = document.getElementById("printSection");

         if (!$printSection) {
             var $printSection = document.createElement("div");
             $printSection.id = "printSection";
             document.body.appendChild($printSection);
             $scope.isprinting = true;
         }

         $printSection.innerHTML = "";
         $scope.isprinting = true;

         $printSection.appendChild(domClone);
     }

      $scope.init = function(){
        $scope.buscarMediosPago();
        $scope.getArriendosActivos();
        $scope.arriendoSeleccionado = undefined;
        $scope.mediospagoseleccionados = [];
        $scope.mediospago = [];
        $scope.bauches = [];
        $scope.valoresMediosPago = [];
        $scope.factura = undefined;
      }

      $scope.init();

    }]);
});
