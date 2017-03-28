'use strict';

requirejs.config({
    baseUrl: 'js',
    paths: {
        'angular': 'ext/angular.min',
    	'angularAMD' : 'ext/angularAMD.min',
    	'angular-ui-router' : 'ext/angular-ui-router.min',
    	'jquery' : 'ext/jquery-3.2.1.min',
		'app-module' : 'app/modules/app-module',
		'indexController' : 'app/controllers/indexController'
    },
    shim: {
    	'angular' : ['jquery'],
    	'angularAMD': ['angular'], 
    	'angular-iu-router': ['angular'],
    	'app-module' : ['angular']
    },
    deps: ['app-module']
});