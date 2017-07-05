define(['app-module', 'clienteService','habitacionService','servicioService'], function (app) {
    app.controller('administracionController',['$scope','$state', 'clienteService','habitacionService','servicioService',
     function ($scope, $state, clienteService,habitacionService,servicioService) {

        $scope.goReportes = function(){
          $state.go("app.administracion.reportes")
        }
        $scope.goAdminServicios = function(){
            $state.go("app.administracion.adminServicios")
       }
        $scope.goAdminHabitaciones = function(){
            $state.go("app.administracion.adminHabitaciones")
       }

        $scope.goconsultarHabitaciones = function(){
            $state.go("app.administracion.consultarHabitaciones")
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
