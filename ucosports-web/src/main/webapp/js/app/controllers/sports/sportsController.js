define(['app-module', 'sportService'], function (app) {
    app.controller('sportsController',['$scope','$state', 'sportService', function ($scope, $state, sportService) {

      $scope.openForm = function(){
        $scope.sport = null;
        $state.go('app.home.sports.buttons.addSport');
      }

      $scope.init = function(){
        $state.go('app.home.sports.buttons');
      }

      $scope.init();

    }]);
});
