define(['app-module'], function (app) {
    app.controller('appController',['$scope','$state', function ($scope, $state) {

      $scope.init = function(){
        $state.go("app.home");
      }

      $scope.init();

    }]);
});
