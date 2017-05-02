define(['app-module', 'sportService', 'sweetService'], function (app) {
    app.controller('addSportController',['$scope','$state', 'sportService', 'sweetService', function ($scope, $state, sportService, sweetService) {

      $scope.addSportStatistic = function(){
        var sportStatistics = {
          name : $scope.sportStatistic
        }
        $scope.sport.sportStatistics.push(sportStatistics);
      }

      $scope.addPlayerStatistic = function(){
        var playerStatistics = {
          name : $scope.playerStatistic
        }
        $scope.sport.playerStatistics.push(playerStatistics);
      }

      $scope.validationForm = function(){
        if($scope.addSportForm.$invalid === true){
          sweetService.warning("¡Te falta llenar algunos campos!");
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
              sweetService.success("¡El deporte '"+data.name+"' ha sido añadido correctamente!");
              $state.reload();
            };
          }, function(error){
            sweetService.error("Error al guardar el deporte.");
          });
        };
      }

      $scope.init = function(){
        $scope.sport = {
          sportStatistics : [],
          playerStatistics : []
        };
      }

      $scope.init();

    }]);
});
