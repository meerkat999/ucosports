define(['app-module', 'playerService'], function (app) {
    app.controller('loginController',['$scope','$state', 'playerService', function ($scope, $state, playerService) {
        $scope.login = function(){
          $state.go('app');
        };

        $scope.jugadores = [];

        $scope.obtener = function(){

          playerService.getAll().then(function(data){
            $scope.jugadores = data;
          })

        };
    }]);
});
