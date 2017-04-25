define(['app-module', 'sportService', 'sweetalert'], function (app) {
    app.controller('addSportController',['$scope','$state', 'sportService', function ($scope, $state, sportService) {

      $scope.validationForm = function(){
        console.log($scope.addSportForm);
        if($scope.addSportForm.$invalid === true){
          swal({
            title: "¡Cuidado!",
            text: "¡Te falta llenar algunos campos!",
            type: "warning",
            confirmButtonText: "¡Está bien!"
          });
          $scope.addPressed = false;
          return false;
        }
        return true;
      }

      $scope.add = function(){
        $scope.addPressed = true;
        if($scope.validationForm() === true){
          sportService.save($scope.sport).then(function(data){
            if(data !== null){
              swal({
                title: "¡Excelente!",
                text: "¡El deporte '"+data.name+"' ha sido añadido correctamente!",
                type: "success",
                confirmButtonText: "¡Está bien!"
              });
              $state.reload();
            };
          }, function(error){
            swal({
              title: "Error!",
              text: error,
              type: "error",
              confirmButtonText: "Cool"
            });
          });
        };
      }

      $scope.init = function(){
        $scope.sport = {};
      }

      $scope.init();

    }]);
});
