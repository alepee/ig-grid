'use strict'

angular.module('igGridApp')
  .controller 'MainCtrl', ($scope, instagram) ->

    $scope.query = 'polabox'
    $scope.response = ''

    $scope.$watch 'query', () ->
      if $scope.query.length >= 3
        $scope.response = instagram.tag.get { query: $scope.query }
        console.log $scope.response