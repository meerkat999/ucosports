define(['app-module', 'arriendoService', 'sweetService', 'habitacionService', 'facturaService', 'mediopagoService'], function (app) {
    app.controller('checkoutController',['$scope','$state', 'arriendoService', 'sweetService', 'habitacionService', '$filter',
    'facturaService', 'mediopagoService',
     function ($scope, $state, arriendoService, sweetService, habitacionService, $filter, facturaService, mediopagoService) {

       $scope.getArriendosActivos = function(){
         arriendoService.getByState({estadoId : 1}).then(function(listaArriendosActivos){
           if(listaArriendosActivos !== undefined && listaArriendosActivos.listaArriendos !== undefined && listaArriendosActivos.listaArriendos.length > 0){
             $scope.arriendoActivos = listaArriendosActivos.listaArriendos;
           }else{
             sweetService.warning("No hay ningún check-in activo.");
             $state.go("app.content");
           }
         })
       }

      $scope.questionCheckOut = function(){
        arriendoService.getById($scope.arriendoSeleccionado).then(function(verificarArriendo){
          if( (verificarArriendo !== undefined && verificarArriendo.dateCheckout !== undefined && verificarArriendo.dateCheckout !== null) ||
              (verificarArriendo !== undefined && verificarArriendo.estadoId !== undefined && verificarArriendo.estadoId !== 1)
            ){
            sweetService.warning("No se le puede generar un check-out. Ya existe uno o el check-in está inactivo.");
          }else{
            habitacionService.getById({id : verificarArriendo.habitacionId}).then(function(verificarHabitacion){
              if(verificarHabitacion !== undefined && verificarHabitacion.estado !== undefined && verificarHabitacion.estado !== 3){
                sweetService.warning("La habitación ya fue activada anteriormente.");
              }else{
                sweetService.question("Realizar Check-out", "¿Está seguro que desea realizar el check-out?", "Realizar", "Cancelar",
                  function(confirm){
                    if(confirm){
                      $scope.checkOut();
                    }
                  }
                )
              }
            })
          }
        })
      }

      $scope.checkOut = function(){
        arriendoService.checkOut($scope.arriendoSeleccionado).then(function(checkout){
          if(checkout !== undefined && checkout.id !== undefined){
            var fecha = $filter('date')(new Date(checkout.dateCheckout), "yyyy/MM/dd 'a las' h:mma");
            sweetService.success("CheckOut realizado correctamente el " + fecha,
            function(success){
              $scope.init();
            });
          }
        },function(error){
          alert("Ha ocurrido un error realizando el checkout. \n Inténtelo nuevamente o comuníquese con el área de sistemas.");
        })

      }

      $scope.openArriendo = function(arriendo){
        $scope.arriendoSeleccionado = arriendo;
        $scope.facturaHallada = undefined;
        var factura = {
          clienteId : arriendo.cliente.id.id,
          tipodocumentoId : arriendo.cliente.id.tipodocumento,
          arriendoId : arriendo.id
        }
        facturaService.getByArriendoAndClienteAndState(factura).then(function(factura){
          if(factura !== undefined && factura.id !== undefined){
            $scope.needFactura = false;
            $scope.facturaHallada = factura;
          }else{
            $scope.needFactura = true;
            $scope.date = new Date();
            $scope.calcularFechaSalida();
            var saldo = arriendo.clienteConsumo === null ? 0 : arriendo.clienteConsumo.saldo === undefined ? 0 : arriendo.clienteConsumo.saldo;
            var numeroNoches = arriendo.numeroNoches === 0 ? $scope.numeroNochesCalculado : arriendo.numeroNoches;
            $scope.totalMonto = (numeroNoches * arriendo.habitacion.precio) + saldo;
          }
        })
      }

      $scope.calcularFechaSalida = function(){
        var fechaActual = new Date($scope.arriendoSeleccionado.dateCheckin);
        var hour = fechaActual.getHours();
        if($scope.arriendoSeleccionado.numeroNoches !== undefined && $scope.arriendoSeleccionado.numeroNoches > 0){
            if(hour < 5){
              $scope.fechaSalida = fechaActual.setHours(12);
            }else{
              fechaActual.setTime(fechaActual.getTime() + ($scope.arriendoSeleccionado.numeroNoches * 24 * 60 * 60 * 1000));
              fechaActual = fechaActual.setHours(12);
              fechaActual = new Date(fechaActual);
              fechaActual = fechaActual.setMinutes(0);
              $scope.fechaSalida = fechaActual;
            }
        }else{
            var checkin = new Date($scope.arriendoSeleccionado.dateCheckin);
            var hour = checkin.getHours();
            var fechaActual = new Date();
            $scope.numeroNochesCalculado = Math.round((fechaActual.getTime() - checkin.getTime())/(1000*60*60*24));
            if($scope.numeroNochesCalculado == 0){
              $scope.numeroNochesCalculado++;
            }
            if(hour < 5 && $scope.numeroNochesCalculado > 0){
              $scope.numeroNochesCalculado++;
              checkin.setTime(checkin.getTime() + (($scope.numeroNochesCalculado-1) * 24 * 60 * 60 * 1000));
            }else{
              checkin.setTime(checkin.getTime() + ($scope.numeroNochesCalculado * 24 * 60 * 60 * 1000));
            }
            checkin = checkin.setHours(12);
            checkin = new Date(checkin);
            checkin = checkin.setMinutes(0);
            $scope.fechaSalida = checkin;
        }
      }

      $scope.mostrarFacturaResultante = function(){
        return $scope.arriendoSeleccionado !== undefined && $scope.needFactura === true;
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
                 listaConsumoPorServicio : null,
                 numeroNochesCalculado : $scope.numeroNochesCalculado
               }
               facturaService.facturarHospedajeAndCheckout($scope.factura).then(function(data){
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
        $scope.getArriendosActivos();
        $scope.arriendoSeleccionado = undefined;
        $scope.needFactura = false;
        $scope.facturaHallada = undefined;
        $scope.arriendoSeleccionado = undefined;
        $scope.mediospagoseleccionados = [];
        $scope.mediospago = [];
        $scope.bauches = [];
        $scope.valoresMediosPago = [];
        $scope.buscarMediosPago();
      }

      $scope.init();

    }]);
});
