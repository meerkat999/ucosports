define(['app-module'], function (app) {
    app.controller('indexController', function ($scope) {
        $scope.message = "Message from HomeCtrl";
        console.log("controlador");
    });
});