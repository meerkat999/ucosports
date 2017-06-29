'use strict';

requirejs.config({
    baseUrl: 'js',
    urlArgs: "bust=" + (new Date()).getTime(),
    paths: {
      'angular': 'ext/angular.min',
      'angularAMD' : 'ext/angularAMD.min',
      'angular-ui-router' : 'ext/angular-ui-router.min',
      'angular-resource' : 'ext/angular-resource.min',
      'jquery' : 'ext/jquery-3.2.1.min',
      'sweetalert' : 'ext/sweetalert.min',
      'app-module' : 'app/modules/app-module',
      'loginController' : 'app/controllers/login/loginController',
      'appController' : 'app/controllers/home/appController',
      'clienteController' : 'app/controllers/clienteController',
      'habitacionController' : 'app/controllers/habitacionController',
      'habitacionService' : 'app/services/habitacionService',
      'servicioController' : 'app/controllers/servicioController',
      'servicioService' : 'app/services/servicioService',
      'checkinController' : 'app/controllers/checkinController',
      'checkoutController' : 'app/controllers/checkoutController',
      'administracionController' : 'app/controllers/administracionController',
      'restService' : 'app/services/restService',
      'clienteService' : 'app/services/clienteService',
      'arriendoService' : 'app/services/arriendoService',
      'tipoDocumentoService' : 'app/services/tipoDocumentoService',
      'sweetService' : 'app/services/util/sweetService',
      'numberDirective' : 'app/directives/numberDirective'
    },
    shim: {
    	'angular' : ['jquery'],
    	'angularAMD': ['angular'],
    	'angular-iu-router': ['angular'],
    	'app-module' : ['angular']
    },
    deps: [
      'app-module', 'sweetService', 'clienteController', 'numberDirective', 'checkinController', 'checkoutController','habitacionController', 'servicioController','administracionController']
});
