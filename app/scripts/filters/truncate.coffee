'use strict';

angular.module('igGridApp')
  .filter 'truncate', () ->
    (input) ->
      'truncate filter: ' + input
