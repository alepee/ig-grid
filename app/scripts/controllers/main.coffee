'use strict'

angular.module('igGridApp').controller 'MainCtrl', ($scope, Instagram) ->

  $scope.query = 'polabox'
  $scope.images = []
  current_proccess = undefined
  lock = false

  $scope.$watch 'query', () ->
    if $scope.query.length >= 3
      current = $scope.query
      getTaggedImages(current) unless lock

  getTaggedImages = (current) ->
    $scope.images = []
    lock = true

    # Call api
    callApi = (current, offset = undefined) ->
      Instagram.tag.get {
        query: current
        max_tag_id: offset if offset
        }, (response) ->
          if response.pagination.next_url
            callApi(current, response.pagination.next_max_tag_id)
            console.log lock, response
          else
            lock = false
            console.log lock, response
          _.map response.data, (item) ->
            $scope.images.push item

    callApi(current)

    # mergeResponse = (response) ->
    #   _.map response, (item) ->
    #     $scope.images.push item

    # lock = false

    # getTaggedImages = (limit = 200, prev = undefined) ->
    #   lock = true
    #   if prev
    #     pagination = prev.pagination.next_max_tag_id
    #     Instagram.tag.get { query: $scope.query, max_tag_id: pagination }, (response) ->
    #       mergeResponse response.data
    #       lock = false
    #       if response.pagination.next_url
    #         getTaggedImages limit, response
    #   else
    #     Instagram.tag.get { query: $scope.query }, (response) ->
    #       $scope.images = []
    #       lock = false
    #       mergeResponse response.data
    #       if response.pagination.next_url
    #         getTaggedImages limit, response

    # $scope.$watch 'query', () ->
    #   if $scope.query.length >= 3 and !lock
    #     next_item = $scope.query
    #     getTaggedImages()