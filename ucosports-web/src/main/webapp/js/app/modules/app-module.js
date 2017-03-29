define(['angularAMD' , 'angular-ui-router'], function (angularAMD) {
    var app = angular.module('app-module', ['ui.router']);

    app.config(function($stateProvider, $urlRouterProvider){

    	$stateProvider
    		.state('login', angularAMD.route({
          url: '/',
          templateUrl : 'resources/partials/login/login.html',
          controller : 'loginController'
    		}))
        .state('app', angularAMD.route({
          url: 'app',
          templateUrl : 'resources/partials/home/app.html'
        }));

    });

    app.run(function($state){
      $state.go('login');
    });

    return angularAMD.bootstrap(app);
});
