class FUNDDY.CustomSelect.Presenter

  placeholderSelected: false

  constructor: (@view) ->
    @subscribeEvents()
    @placeholderSelected = !!@view.getPlaceholder()

  subscribeEvents: ->
    @view.onFocus(@focus)
    @view.onBlur(@blur)
    @view.onChange(@select)

  focus: =>
    @view.showAsFocused()

  blur: =>
    if (@placeholderSelected) then @view.showAsPlaceholder() else @view.showAsBlur()

  select: (text) =>
    @placeholderSelected = text is @view.getPlaceholder()
    @view.setSelectedText(text)