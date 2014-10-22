
# lib/drag.coffee

{$}      = require 'atom'
pathUtil = require 'path'
Paste    = require './paste'

exports.drag = (e) ->
  if not (editor = atom.workspace.getActivePane()?.getActiveEditor())  or 
         (pathUtil.extname(editor.getPath()).toLowerCase()) isnt '.md' 
    return
    
  $title = $(e.target).closest('.tab').find('.title')

  if not /\.(jpg|jpeg|gif|png)$/i.test $title.text().toLowerCase() 
    return
  
  new Paste $title.attr('data-path'), editor
  