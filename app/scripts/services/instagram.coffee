'use strict';

angular.module('igGridApp')
  .factory 'instagram', ($http) ->
    # Service logic
    endpoint = "https://api.instagram.com/v1/"
    parameters = '?client_id=97eb263822c549db9d018413c0a50945&callback=JSON_CALLBACK'

    # Public API here
    {
      getTagged: (query) ->
        $http.jsonp(endpoint+'/tags/'+query+'/media/recent/'+parameters)
    }
