class FUNDDY.CustomSelect.View

  PLACEHOLDER_CLASS = "global__select--placeholder"
  FOCUS_CLASS = "global__select--focus"
  TEXT_NODE_TYPE = 3

  constructor: (@elements) ->
    placeholder = @getPlaceholder()
    if not placeholder
      @setSelectedText(@getSelectedText())
      return
    @elements.select.prepend(@createDefaultPlaceholderOption(placeholder))
    @setSelectedText(placeholder)
    @showAsPlaceholder()

  createDefaultPlaceholderOption: (placeholder) ->
    @elements.placeholderOption.text(placeholder)

  getPlaceholder: ->
    @elements.select.attr("placeholder")

  getSelectedText: ->
    @elements.select.find(":selected").text()

  onFocus: (callback) ->
    @elements.select.on("focus", callback)

  onBlur: (callback) ->
    @elements.select.on("blur", callback)

  onChange: (callback) ->
    @elements.select.on("change", =>
      text = @getSelectedText()
      callback(text)
    )

  showAsFocused: ->
    @elements.container.removeClass(PLACEHOLDER_CLASS).addClass(FOCUS_CLASS)

  showAsBlur: ->
    @elements.container.removeClass(FOCUS_CLASS)

  showAsPlaceholder: ->
    @elements.container.removeClass(FOCUS_CLASS).addClass(PLACEHOLDER_CLASS)

  removeStyles: ->
    @elements.container.removeClass(PLACEHOLDER_CLASS).removeClass(FOCUS_CLASS)

  setSelectedText: (text) ->
    textNodes = @getContainerTextNodes()
    if (textNodes.length > 0)
      textNode = textNodes[textNodes.length - 1]
      $(textNode).remove()
    @elements.container.append(document.createTextNode(text))

  getContainerTextNodes: ->
    @elements.container.children(":not(iframe)").addBack().contents().filter(->
      @.nodeType is TEXT_NODE_TYPE and ($.trim(@.nodeValue) isnt "")
    )
