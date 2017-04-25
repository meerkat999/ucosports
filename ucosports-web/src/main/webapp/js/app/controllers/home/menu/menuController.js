define(['app-module'], function (app) {
    app.controller('menuController',['$scope','$state', function ($scope, $state) {

      $scope.openSport = function(){
        $state.go("app.home.sports.index");
      }

      $scope.openTeams = function(){
        $state.go("app.home.teams");
      }

      $scope.logout = function(){
        $state.go("login");
      }

      $scope.init = function(){

      }

      $scope.init();

    }]);
});
