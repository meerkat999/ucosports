define(['app-module', 'loginService'], function (app) {
    app.controller('menuController',['$scope','$state', 'loginService', function ($scope, $state, loginService) {

      $scope.openSport = function(){
        $state.go("app.home.sports");
      }

      $scope.openTeams = function(){
        $state.go("app.home.teams");
      }

      $scope.logout = function(){
        loginService.logout().then(function(){
          $state.go("login");
        });
      }

      $scope.init = function(){

      }

      $scope.init();

    }]);
});
