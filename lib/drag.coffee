
# lib/drag.coffee

{$}       = require 'atom'
pathUtil  = require 'path'
projHost  = require './proj-host'
imgurHost = require './imgur-host'

exports.drag = (e) ->
  if not (editor = atom.workspace.getActivePane()?.getActiveEditor())  or 
         (pathUtil.extname(editor.getPath()).toLowerCase()) isnt '.md' 
    return
    
  $title = $(e.target).closest('.tab').find('.title')
  if not /\.(jpg|jpeg|gif|png)$/i.test $title.text().toLowerCase() 
    return
  imagePath = $title.attr 'data-path'
  
  if atom.config.get 'auto-host-markdown-image.hostFromYourGithubRepoInsteadOfImgur'
    projHost editor, imagePath
  else
    imgurHost editor, imagePath
