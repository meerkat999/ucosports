'use strict';

requirejs.config({
    baseUrl: 'js',
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
      'checkinController' : 'app/controllers/checkinController',
      'administracionController' : 'app/controllers/administracionController',
      'restService' : 'app/services/restService',
      'clienteService' : 'app/services/clienteService',
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
      'app-module', 'sweetService', 'clienteController', 'numberDirective', 'checkinController', 'administracionController']
});
