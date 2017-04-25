'use strict';
define(['angularAMD' , 'angular-ui-router', 'angular-resource'], function (angularAMD) {
    var app = angular.module('app-module', ['ui.router', 'ngResource']);

    app.config(function($stateProvider, $urlRouterProvider, $httpProvider){

      $httpProvider.defaults.headers.post['Content-Type'] =  'application/json';

    	$stateProvider
    		.state('login', angularAMD.route({
          url: '/',
          name : 'login',
          templateUrl : 'resources/partials/login/login.html',
          controller : 'loginController'
    		}))
        .state('app', angularAMD.route({
          url: 'app',
          templateUrl : 'resources/partials/home/app.html',
          controller : 'appController'
        }))
        .state('app.menu', angularAMD.route({
          url: '/menu',
          templateUrl : 'resources/partials/home/menu/menu.html',
          controller : 'menuController'
        }))
        .state('app.content', angularAMD.route({
          templateUrl : 'resources/partials/home/menu/menu.html'
        }))
        ;
    });



    app.run(function($state, $rootScope){
      $state.go('login');

      $rootScope.$on('$stateChangeSuccess', function(event, toState, toParams, fromState, fromParams){
      })
    });

    return angularAMD.bootstrap(app);
});
