define(['app-module', 'clienteService','habitacionService','servicioService'], function (app) {
    app.controller('administracionController',['$scope','$state', 'clienteService','habitacionService','servicioService',
     function ($scope, $state, clienteService,habitacionService,servicioService) {

        $scope.goAdminClientes = function(){
          $state.go("app.administracion.adminClientes")
        }
        $scope.goRegistrarHabitacion = function(){
            $state.go("app.administracion.registrarHabitacion")
       }
        $scope.goRegistrarServicio = function(){
            $state.go("app.administracion.registrarServicio")
       }
        
        $scope.getMonthsWithClients = function(year){
          clienteService.getMonthsWithClients(year).then(function(listafechas){
            $scope.listaMesesConClientes = listafechas.listaFechas;
          })
        }

      $scope.init = function(){
        $scope.listaMesesConClientes = [];
        $scope.listaYearsConClientes = [];
        clienteService.getYearsWithClients().then(function(years){
          $scope.listaYearsConClientes = years;
        })
      }

      $scope.init();

    }]);
});
