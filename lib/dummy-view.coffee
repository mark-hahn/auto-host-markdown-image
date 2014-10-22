
# lib/dummy-view.coffee

{$, View} = require 'atom'
Paste  = require './paste'

module.exports =
class DummyView extends View
  
  @content: -> @div class:'ahmi-dummy-view', ''
    
  initialize: (dummyItem) -> 
    filePath = dummyItem.getFilePath()
    editor   = dummyItem.getEditor()
    
    process.nextTick => 
      $pane = @.closest '.pane'
      $pane.find('.ahmi-dummy-view').remove()
      $pane.find('.tab .title').each ->
        $title = $ @
        if $title.text() is '~dummy tab~'
          $title.closest('.tab')[0].destroy()
      
      new Paste filePath, editor
      
  destroy: ->
    @detach()
