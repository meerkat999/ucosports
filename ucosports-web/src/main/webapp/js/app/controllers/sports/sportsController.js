define(['app-module', 'sportService'], function (app) {
    app.controller('sportsController',['$scope','$state', 'sportService', function ($scope, $state, sportService) {

      $scope.openForm = function(){
        $scope.isAdd = !$scope.isAdd;
      }

      $scope.init = function(){
        $scope.isAdd = false;
        $state.go('app.home.sports.index');
      }

      $scope.init();

    }]);
});
