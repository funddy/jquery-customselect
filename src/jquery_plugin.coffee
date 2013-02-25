do (jQuery) ->
  jQuery.fn.customSelect = ->
    for sel in @
      select = $(sel)
      new FUNDDY.CustomSelect.Presenter(
        new FUNDDY.CustomSelect.View(
          select: select
          container: select.parent()
          placeholderOption: $('<option disabled="true" selected="selected"></option>')
        )
      )