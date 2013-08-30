class HeaderView extends Backbone.View
  events: {  
    'click #explore'                : 'showCustom'
    'keyup #api_source'   			: 'showCustomOnKeyup'
    'keyup #input_apiKey'           : 'showCustomOnKeyup'
  }

  initialize: ->


  showCustomOnKeyup: (e) ->
    @showCustom() if e.keyCode is 13

  showCustom: (e) ->
    e?.preventDefault()
    @trigger(
      'update-swagger-ui'
      {url: $('#api_source').val(), apiKey: $('#input_apiKey').val()}
    )

  update: (url, apiKey, trigger = false) ->
    $('input.editable-select').val url
    #$('#input_apiKey').val apiKey
    @trigger 'update-swagger-ui', {url:url} if trigger
