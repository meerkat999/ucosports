'use strict';
define(['angularAMD', 'angular-ui-router', 'angular-resource'], function (angularAMD) {
    var app = angular.module('app-module', ['ui.router', 'ngResource']);

    app.config(function($stateProvider, $urlRouterProvider, $httpProvider){

      $httpProvider.defaults.headers.post['Content-Type'] =  'application/json';


    	$stateProvider
			.state('login', angularAMD.route({
				  url: '/',
				  name : 'login',
				  templateUrl : 'resources/partials/login/login.html' + "?bust=" + (new Date()).getTime(),
				  controller : 'loginController'
				})
			)
			.state('app', angularAMD.route({
				  url: 'app',
				  templateUrl : 'resources/partials/home/app.html' + "?bust=" + (new Date()).getTime(),
				  controller : 'appController'
				})
			)
      .state('app.content', {
        url: '/content',
        views: {
          'content@app': angularAMD.route({
            templateUrl : 'resources/partials/home/indexContent.html' + "?bust=" + (new Date()).getTime()
          })
        }
      })
      .state('app.checkinMenu', {
        url: '/checkinmenu',
        views: {
          'content@app': angularAMD.route({
            templateUrl : 'resources/partials/checkin/checkinmenu.html' + "?bust=" + (new Date()).getTime(),
            controller : 'checkinMenuController'
          })
        }
      })
      .state('app.facturacion', {
        url: '/facturacion',
        views: {
          'content@app': angularAMD.route({
            templateUrl : 'resources/partials/facturacion/facturacionmenu.html' + "?bust=" + (new Date()).getTime(),
            controller : 'facturacionMenuController'
          })
        }
      })
      .state('app.facturacion.hospedajes', {
        url: '/hospedajes',
        views: {
          'content@app.facturacion': angularAMD.route({
            templateUrl : 'resources/partials/facturacion/facturacionHospedajes.html' + "?bust=" + (new Date()).getTime(),
            controller : 'facturacionHospedajeController'
          })
        }
      })
      .state('app.facturacion.serviciosAdicionales', {
        url: '/serviciosAdicionales',
        views: {
          'content@app.facturacion': angularAMD.route({
            templateUrl : 'resources/partials/facturacion/serviciosAdicionales.html' + "?bust=" + (new Date()).getTime(),
            controller : 'servicioController'
          })
        }
      })
      .state('app.facturacion.serviciosAdicionales.registro', {
        url: '/registro',
        views: {
          'registro@app.facturacion.serviciosAdicionales': angularAMD.route({
            templateUrl : 'resources/partials/cliente/registrarCliente.html' + "?bust=" + (new Date()).getTime(),
            controller : 'clienteController'
          })
        }
      })
      .state('app.checkinMenu.nuevo', {
        url: '/nuevo',
        views: {
          'content@app.checkinMenu': angularAMD.route({
            templateUrl : 'resources/partials/checkin/checkin.html' + "?bust=" + (new Date()).getTime(),
            controller : 'checkinController'
          })
        }
      })
      .state('app.checkinMenu.addAcompanante', {
        url: '/addAcompanante',
        views: {
          'content@app.checkinMenu': angularAMD.route({
            templateUrl : 'resources/partials/checkin/addacompanante.html' + "?bust=" + (new Date()).getTime(),
            controller : 'checkinController'
          })
        }
      })
      .state('app.checkinMenu.addAcompanante.registroAcompanante', {
        url: '/registroAcompanante',
        views: {
          'registro@app.checkinMenu.addAcompanante': angularAMD.route({
            templateUrl : 'resources/partials/cliente/registrarCliente.html' + "?bust=" + (new Date()).getTime(),
            controller : 'clienteController'
          })
        }
      })
      .state('app.checkinMenu.nuevo.registro', {
        url: '/registro',
        views: {
          'registro@app.checkinMenu.nuevo': angularAMD.route({
            templateUrl : 'resources/partials/cliente/registrarCliente.html' + "?bust=" + (new Date()).getTime(),
            controller : 'clienteController'
          })
        }
      })
      .state('app.checkinMenu.nuevo.registroAcompanante', {
        url: '/registroAcompanante',
        views: {
          'registroAcompanante@app.checkinMenu.nuevo': angularAMD.route({
            templateUrl : 'resources/partials/cliente/registrarCliente.html' + "?bust=" + (new Date()).getTime(),
            controller : 'clienteController'
          })
        }
      })
      .state('app.checkout', {
        url: '/checkout',
        views: {
          'content@app': angularAMD.route({
            templateUrl : 'resources/partials/checkout/checkout.html' + "?bust=" + (new Date()).getTime(),
            controller : 'checkoutController'
          })
        }
      })
      .state('app.administracion', {
        url: '/administracion',
        views: {
          'content@app': angularAMD.route({
            templateUrl : 'resources/partials/administracion/administracion.html' + "?bust=" + (new Date()).getTime(),
            controller : 'administracionController'
          })
        }
      })
       .state('app.administracion.adminHabitaciones.registrarHabitacion', {
        url: '/registrarHabitacion',
        views: {
          'content@app.administracion': angularAMD.route({
            templateUrl : 'resources/partials/habitacion/registrarHabitacion.html' + "?bust=" + (new Date()).getTime(),
            controller : 'habitacionController'
          })
        }
    })

    .state('app.administracion.adminHabitaciones.modificarHabitaciones', {
        url: '/modificarHabitaciones',
        views: {
          'content@app.administracion': angularAMD.route({
            templateUrl : 'resources/partials/habitacion/modificarHabitaciones.html' + "?bust=" + (new Date()).getTime(),
            controller : 'habitacionController'
          })
        }
    })

    .state('app.administracion.adminHabitaciones.modificarHabitaciones.editarHabitaciones', {
         url: '/editarHabitaciones',
         views: {
           'editar@app.administracion.adminHabitaciones.modificarHabitaciones': angularAMD.route({
             templateUrl : 'resources/partials/habitacion/registrarHabitacion.html' + "?bust=" + (new Date()).getTime()
           })
         }
       })

    .state('app.administracion.adminHabitaciones.activarHabitaciones', {
        url: '/activarHabitacion',
        views: {
          'content@app.administracion': angularAMD.route({
            templateUrl : 'resources/partials/habitacion/activarHabitaciones.html' + "?bust=" + (new Date()).getTime(),
            controller : 'habitacionController'
          })
        }
    })

    .state('app.administracion.consultarHabitaciones', {
        url: '/consultarHabitaciones',
        views: {
          'content@app.administracion': angularAMD.route({
            templateUrl : 'resources/partials/habitacion/consultarHabitaciones.html' + "?bust=" + (new Date()).getTime(),
            controller : 'habitacionController'
          })
        }
    })
      .state('app.administracion.reportes', {
          url: '/reportes',
          views: {
            'content@app.administracion': angularAMD.route({
              templateUrl : 'resources/partials/administracion/reportes.html' + "?bust=" + (new Date()).getTime(),
              controller : 'administracionController'
            })
          }
      })

      .state('app.administracion.adminHabitaciones', {
          url: '/adminHabitaciones',
          views: {
            'content@app.administracion': angularAMD.route({
              templateUrl : 'resources/partials/administracion/adminHabitaciones.html' + "?bust=" + (new Date()).getTime(),
              controller : 'habitacionController'
            })
          }
      })


      .state('app.administracion.adminServicios', {
          url: '/adminServicios',
          views: {
            'content@app.administracion': angularAMD.route({
              templateUrl : 'resources/partials/administracion/adminServicios.html' + "?bust=" + (new Date()).getTime(),
              controller : 'servicioController'
            })
          }
        })
        .state('app.administracion.adminServicios.registrarServicio', {
         url: '/registrarServicio',
         views: {
           'content@app.administracion.adminServicios': angularAMD.route({
             templateUrl : 'resources/partials/servicio/registrarServicios.html' + "?bust=" + (new Date()).getTime()
           })
         }
       })
        .state("app.administracion.adminHabitaciones.consultarHabitaciones", {
          url: '/consultarHabitaciones',
          views: {
            'content@app.administracion.adminHabitaciones': angularAMD.route({
              templateUrl : 'resources/partials/habitacion/consultarHabitaciones.html' + "?bust=" + (new Date()).getTime()
            })
          }
        })

         .state('app.administracion.adminServicios.modificarServicios', {
          url: '/modificarServicios',
          views: {
            'content@app.administracion.adminServicios': angularAMD.route({
              templateUrl : 'resources/partials/servicio/modificarServicios.html' + "?bust=" + (new Date()).getTime()
            })
          }
        })
        .state('app.administracion.adminServicios.modificarServicios.editarServicio', {
         url: '/editarServicio',
         views: {
           'editar@app.administracion.adminServicios.modificarServicios': angularAMD.route({
             templateUrl : 'resources/partials/servicio/registrarServicios.html' + "?bust=" + (new Date()).getTime()
           })
         }
       })

       .state('app.administracion.adminServicios.activarServicios', {
         url: '/activarServicios',
         views: {
           'content@app.administracion.adminServicios': angularAMD.route({
             templateUrl : 'resources/partials/servicio/activarServicios.html' + "?bust=" + (new Date()).getTime()
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
