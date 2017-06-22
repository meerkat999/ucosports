define(['app-module', 'sportService'], function (app) {
    app.controller('seeSportController',['$scope','$state', 'sportService', function ($scope, $state, sportService) {

      $scope.openEdit = function(){
        $state.go('app.home.sports.buttons.seeSport.edit');
      }

      $scope.init = function(){
      };

      $scope.init();

    }]);
});
