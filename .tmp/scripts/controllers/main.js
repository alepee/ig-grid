(function() {
  'use strict';  angular.module('igGridApp').controller('MainCtrl', function($scope, Instagram) {
    var current_proccess, getTaggedImages, lock;

    $scope.query = 'polabox';
    $scope.images = [];
    current_proccess = void 0;
    lock = false;
    $scope.$watch('query', function() {
      var current;

      if ($scope.query.length >= 3) {
        current = $scope.query;
        if (!lock) {
          return getTaggedImages(current);
        }
      }
    });
    return getTaggedImages = function(current) {
      var callApi;

      $scope.images = [];
      lock = true;
      callApi = function(current, offset) {
        if (offset == null) {
          offset = void 0;
        }
        return Instagram.tag.get({
          query: current,
          max_tag_id: offset ? offset : void 0
        }, function(response) {
          if (response.pagination.next_url) {
            callApi(current, response.pagination.next_max_tag_id);
            console.log(lock, response);
          } else {
            lock = false;
            console.log(lock, response);
          }
          return _.map(response.data, function(item) {
            return $scope.images.push(item);
          });
        });
      };
      return callApi(current);
    };
  });

}).call(this);
