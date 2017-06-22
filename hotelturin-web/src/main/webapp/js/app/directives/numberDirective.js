define(['app-module'], function (app) {
  app.directive('number', function() {
    return {
      require: 'ngModel',
      restrict: 'A',
      link: function (scope, element, attrs, ngModelCtrl) {
        function fromUser(text) {
          var maxlength = Number(attrs.maxlength);
          var digits = text.replace(/[^0-9]/g, '');
          if (String(text).length > maxlength || text !== digits) {
            ngModelCtrl.$setViewValue(ngModelCtrl.$modelValue);
            ngModelCtrl.$render();
            return ngModelCtrl.$modelValue;
          }
          return text;
        }
        ngModelCtrl.$parsers.push(fromUser);
      }
    };
  })
});
