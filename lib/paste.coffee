
# lib/paste.coffee

{post} = require './post'

module.exports =
class Paste
  
  constructor: (filePath, editor) ->
    console.log 'post constructor', {filePath, editor}
    
    atom.workspace.getActivePane().activateItem editor
    post filePath, (res) ->
      editor.insertText '\n\n![Image inserted by Atom editor package auto-host-markdown-image]' +
                           '(' + res.link + '?delhash=' + res.deletehash + ')\n\n'
    