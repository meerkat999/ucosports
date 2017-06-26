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
          },
          info : function(title, text){
            swal({title: title,text: text, confirmButtonText: "¡Está bien!"});
          },
          question : function(title, text, confirmButtonText, cancelButtonText, func){
            swal({title: title, text: text, showCancelButton: true, confirmButtonText: confirmButtonText, cancelButtonText : cancelButtonText }, func);
          }
        };

        return services;

    }]);
});
