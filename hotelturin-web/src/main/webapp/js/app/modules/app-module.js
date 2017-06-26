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
				})
			)
			.state('app', angularAMD.route({
				  url: 'app',
				  templateUrl : 'resources/partials/home/app.html',
				  controller : 'appController'
				})
			)
      .state('app.checkin', {
        url: '/checkin',
        views: {
          'content@app': angularAMD.route({
            templateUrl : 'resources/partials/checkin/checkin.html',
            controller : 'checkinController'
          })
        }
      })      
      .state('app.checkin.registro', {
        url: '/registro',
        views: {
          'registro@app.checkin': angularAMD.route({
            templateUrl : 'resources/partials/cliente/registrarCliente.html',
            controller : 'clienteController'
          })
        }
      })
      .state('app.administracion', {
        url: '/administracion',
        views: {
          'content@app': angularAMD.route({
            templateUrl : 'resources/partials/administracion/administracion.html',
            controller : 'administracionController'
          })
        }
      })
       .state('app.administracion.registrarHabitacion', {
        url: '/registrarHabitacion',
        views: {
          'content@app.administracion': angularAMD.route({
            templateUrl : 'resources/partials/habitacion/registrarHabitacion.html',
            controller : 'habitacionController'
          })
        }      
    })
      .state('app.administracion.adminClientes', {
          url: '/adminClientes',
          views: {
            'content@app.administracion': angularAMD.route({
              templateUrl : 'resources/partials/administracion/adminClientes.html',
              controller : 'clienteController'
            })
          }
        })
      })
     ;

    app.run(function($state, $rootScope){
      $state.go('login');

      $rootScope.$on('$stateChangeSuccess', function(event, toState, toParams, fromState, fromParams){

      })

    });

    return angularAMD.bootstrap(app);

});
