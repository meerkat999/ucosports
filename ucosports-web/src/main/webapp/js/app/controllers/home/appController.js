define(['app-module'], function (app) {
    return app.controller('appController',['$scope','$state', function ($scope, $state) {

      $scope.init = function(){
        console.log("cargará menú");
        $state.go("app.menu");
      }

      $scope.init();

    }]);
});
