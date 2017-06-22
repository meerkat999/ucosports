define(['app-module', 'sweetalert'], function (app) {
    app.factory('sweetService',[function () {

        var services = {
          error : function(text){
            swal({title: "¡Error!",text: text,type: "error", confirmButtonText: "¡Está bien!"});
          },
          warning : function(text){
            swal({title: "¡Cuidado!",text: text,type: "warning", confirmButtonText: "¡Está bien!"});
          },
          success : function(text){
            swal({title: "¡Excelente!",text: text,type: "success", confirmButtonText: "¡Está bien!"});
          }
        };

        return services;

    }]);
});
