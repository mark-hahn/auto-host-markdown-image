
# lib/drag.coffee

{$}      = require 'atom'
pathUtil = require 'path'
{post}   = require './post'

exports.drag = (e) ->
  if not (editor = atom.workspace.getActivePane()?.getActiveEditor())  or 
         (pathUtil.extname(editor.getPath()).toLowerCase()) isnt '.md' 
    return
    
  $title = $(e.target).closest('.tab').find('.title')

  if not /\.(jpg|jpeg|gif|png)$/i.test $title.text().toLowerCase() 
    return
  
  post $title.attr('data-path'), (res) ->
    editor.insertText '\n\n![Image inserted by Atom editor package auto-host-markdown-image]' +
                       '(' + res.link + '?delhash=' + res.deletehash + ')\n\n'
    