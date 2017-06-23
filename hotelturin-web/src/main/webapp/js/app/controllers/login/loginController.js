define(['app-module'], function (app) {
    app.controller('loginController',['$scope','$state', function ($scope, $state) {
        $scope.login = function(){
          $state.go('app');
        };
    }]);
});
