define(['app-module', 'sportService'], function (app) {
    app.controller('buttomsSportsController',['$scope','$state', 'sportService', function ($scope, $state, sportService) {

      $scope.getSports = function(){
        sportService.getAll().then(function(data){
          if(data !== null){
            $scope.buttoms = data;
          }
        })
      };

      $scope.init = function(){
        $scope.buttoms = [];
        $scope.getSports();
      };

      $scope.init();

    }]);
});
