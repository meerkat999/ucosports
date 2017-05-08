'use strict';
define(['angularAMD', 'angular-ui-router', 'angular-resource'], function (angularAMD) {
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
        .state('app.home', {
  				url: '/home',
  				views: {
  					'menu@app': angularAMD.route({
              templateUrl : 'resources/partials/home/menu/menu.html',
              controller : 'menuController'
  					})
  				}
  			})
        .state('app.home.sports', {
  				url: '/sports',
  				views: {
  					'content@app': angularAMD.route({
              templateUrl : 'resources/partials/sport/sports.html',
              controller : 'sportsController'
  					})
  				}
  			})
        .state('app.home.sports.buttons', {
  				url: '/button',
  				views: {
  					'buttomsSports@app.home.sports': angularAMD.route({
              templateUrl : 'resources/partials/sport/items/buttomsSports.html',
              controller : 'buttomsSportsController'
  					})
  				}
  			})
        .state('app.home.sports.buttons.addSport', {
  				url: '/add',
  				views: {
            'content@app.home.sports': angularAMD.route({
              templateUrl : 'resources/partials/sport/items/addSport.html',
              controller : 'addSportController'
  					})
  				}
  			})
        .state('app.home.sports.buttons.seeSport', {
  				url: '/see',
  				views: {
            'content@app.home.sports': angularAMD.route({
              templateUrl : 'resources/partials/sport/items/seeSport.html',
              controller : 'seeSportController'
  					})
  				}
  			})
        .state('app.home.sports.buttons.seeSport.edit', angularAMD.route({
          url: 'edit',
          templateUrl : 'resources/partials/sport/items/addSport.html',
          controller : 'addSportController'
        }))
        .state('app.home.teams', {
  				url: '/teams',
  				views: {
  					'content@app': angularAMD.route({
              templateUrl : 'resources/partials/teams/teams.html'
  					})
  				}
  			})
        ;
    });

    app.run(function($state, $rootScope){
      $state.go('login');

      $rootScope.$on('$stateChangeSuccess', function(event, toState, toParams, fromState, fromParams){

      })
    });

    return angularAMD.bootstrap(app);
});
