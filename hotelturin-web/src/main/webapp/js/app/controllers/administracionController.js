define(['app-module', 'clienteService','habitacionService'], function (app) {
    app.controller('administracionController',['$scope','$state', 'clienteService','habitacionService',
     function ($scope, $state, clienteService,habitacionService) {

        $scope.goAdminClientes = function(){
          $state.go("app.administracion.adminClientes")
        }
        $scope.goRegistrarHabitacion = function(){
            $state.go("app.administracion.registrarHabitacion")
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
