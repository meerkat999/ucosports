define(['angularAMD' , 'angular-ui-router'], function (angularAMD) {
    var app = angular.module('app-module', ['ui.router']);

    app.config(function($stateProvider, $urlRouterProvider){

    	$stateProvider.
    		state('app', angularAMD.route({
          url: '',
          templateUrl : 'resources/partials/prueba.html',
          controller : 'indexController'
    		}));

    	$urlRouterProvider.otherwise('/app');

    });

    return angularAMD.bootstrap(app);
});
