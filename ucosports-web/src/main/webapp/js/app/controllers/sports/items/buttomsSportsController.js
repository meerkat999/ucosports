define(['app-module', 'sportService'], function (app) {
    app.controller('buttomsSportsController',['$scope','$state', 'sportService', function ($scope, $state, sportService) {

      $scope.getSports = function(){
        sportService.getAll().then(function(data){
          if(data !== null){
            $scope.buttoms = data;
          }
        })
      };

      $scope.openSport = function(sport){
        $scope.$parent.seeSport = sport;
        $state.go('app.home.sports.buttons.seeSport');
      }

      $scope.init = function(){
        $scope.buttoms = [];
        $scope.getSports();
      };

      $scope.init();

    }]);
});
