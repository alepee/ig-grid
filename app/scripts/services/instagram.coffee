'use strict';

angular.module('igGridApp')
  .factory 'Instagram', ['$resource', ($resource) ->
    # Service logic
    endpoint = "https://api.instagram.com/v1/"
    defaultParams =
      client_id: '97eb263822c549db9d018413c0a50945'
      callback: 'JSON_CALLBACK'

    # Public API here
    {
      tag: $resource endpoint + 'tags/:query/media/recent/', defaultParams, get: {method: 'JSONP'}
    }
  ]