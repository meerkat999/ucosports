define(['app-module', 'arriendoService', 'sweetService', 'habitacionService'], function (app) {
    app.controller('checkoutController',['$scope','$state', 'arriendoService', 'sweetService', 'habitacionService', '$filter',
     function ($scope, $state, arriendoService, sweetService, habitacionService, $filter) {

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

            sweetService.warning("Todavía no se valida la ausencia de una factura.");
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
            sweetService.success("CheckOut realizado correctamente el " + fecha);
            $scope.init();
          }
        },function(error){
          alert("Ha ocurrido un error realizando el checkout. \n Inténtelo nuevamente o comuníquese con el área de sistemas.");
        })

      }

      $scope.openArriendo = function(arriendo){
        $scope.arriendoSeleccionado = arriendo;
      }

      $scope.init = function(){
        $scope.getArriendosActivos();
        $scope.arriendoSeleccionado = undefined;
      }

      $scope.init();

    }]);
});
