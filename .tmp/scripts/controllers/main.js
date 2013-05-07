(function() {
  'use strict';  angular.module('igGridApp').controller('MainCtrl', function($scope, instagram) {
    $scope.query = 'polabox';
    $scope.response = '';
    return $scope.$watch('query', function() {
      if ($scope.query.length >= 3) {
        $scope.response = instagram.tag.get({
          query: $scope.query
        });
        return console.log($scope.response);
      }
    });
  });

}).call(this);
