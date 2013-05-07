(function() {
  'use strict';  angular.module('igGridApp').filter('truncate', function() {
    return function(input) {
      return 'truncate filter: ' + input;
    };
  });

}).call(this);
