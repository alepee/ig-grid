'use strict'

describe 'Service: instagram', () ->

  # load the service's module
  beforeEach module 'igGridApp'

  # instantiate service
  instagram = {}
  beforeEach inject (_instagram_) ->
    instagram = _instagram_

  it 'should do something', () ->
    expect(!!instagram).toBe true;
