define(['app-module', 'clienteService'], function (app) {
    app.controller('administracionController',['$scope','$state', 'clienteService',
     function ($scope, $state, clienteService) {

        $scope.goAdminClientes = function(){
          $state.go("app.administracion.adminClientes")
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
