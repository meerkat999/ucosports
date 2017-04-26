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
      'menuController' : 'app/controllers/home/menu/menuController',
      'sportsController' : 'app/controllers/sports/sportsController',
      'buttomsSportsController' : 'app/controllers/sports/items/buttomsSportsController',
      'addSportController' : 'app/controllers/sports/items/addSportController',
      'restService' : 'app/services/restService',
      'playerService' : 'app/services/playerService',
      'sportService' : 'app/services/sports/sportService',
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
      'app-module',
      'menuController',
      'sportsController',
      'buttomsSportsController',
      'addSportController',
      'numberDirective']
});
