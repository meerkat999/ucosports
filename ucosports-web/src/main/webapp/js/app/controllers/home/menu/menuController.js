define(['app-module'], function (app) {
    return app.controller('menuController',['$scope','$state', function ($scope, $state) {

      $scope.openSport = function(){
      }

      $scope.init = function(){
        console.log("erera");
      }

      $scope.init();

    }]);
});
