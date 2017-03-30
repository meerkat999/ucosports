define(['app-module', 'playerService'], function (app) {
    app.controller('loginController',['$scope','$state', 'playerService', function ($scope, $state, playerService) {
        $scope.login = function(){
          $state.go('app');
        };

        $scope.jugadores = [];
        $scope.jugador = {};

        $scope.obtener = function(){
          playerService.getAll().then(function(data){
            $scope.jugadores = data;
          });
          var player = {id : 1, firtsName : null};
          playerService.getById(player).then(function(data){
            $scope.jugador = data;
          });
        };

        $scope.meter = function(){
          playerService.prueba().then(function(data){
            $scope.jugadoresMetidos = data;
          });
        }

    }]);
});
