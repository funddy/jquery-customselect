describe "CustomSelect", ->

  getSelectedText = (container) ->
    container.contents()[1].nodeValue

  describe "without placeholder", ->

    container = null
    select = null

    beforeEach ->
      container = $("<div></div>")
      select = $("<select></select>")
      addOption("default")
      container.append(select)
      select.customSelect()

    addOption = (text) ->
      option = $("<option selected>#{text}</option>")
      select.append(option)

    describe "setup", ->

      it "creates placeholder from first option", ->
        expect(getSelectedText(container)).to.be("default")

    describe "on focus", ->

      it "adds focus class", ->
        select.trigger("focus")
        expect(container.hasClass("custom-select--focus")).to.be.ok()

    describe "on select", ->

      it "changes text to selected option", ->
        addOptionAndSelect("foo")
        expect(getSelectedText(container)).to.be("foo")

      addOptionAndSelect = (text) ->
        addOption(text)
        select.trigger("change")

    describe "on blur", ->

      it "removes focus class", ->
        select.trigger("focus")
        select.trigger("blur")
        expect(container.hasClass("custom-select--focus")).not.to.be.ok()

  describe "with placeholder", ->

    container = null
    select = null

    beforeEach ->
      container = $("<div></div>")
      select = $('<select placeholder="placeholder"></select>')
      container.append(select)
      select.customSelect()

    describe "setup", ->

      it "adds text", ->
        expect(getSelectedText(container)).to.be("placeholder")

      it "adds selected disabled option", ->
        expect(select.html()).to.be('<option disabled="true" selected="selected">placeholder</option>')

      it "adds placeholder class", ->
        expect(container.hasClass("custom-select--placeholder")).to.be.ok()

    describe "on blur", ->

      it "adds placeholder class when placeholder option is selected", ->
        select.trigger("change")
        select.trigger("blur")
        expect(container.hasClass("custom-select--placeholder")).to.be.ok()
