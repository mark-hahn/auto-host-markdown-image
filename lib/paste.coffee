
# lib/paste.coffee

post = require('./post').post

module.exports =
class Paste
  
  constructor: (filePath, editor) ->
    console.log 'Paste constructor', {filePath, editor}
    atom.workspace.getActivePane().activateItem editor
    
    post filePath, (res) ->
      console.log 'Paste post result', res
      editor.insertText '\n![Image inserted by Atom editor package auto-host-markdown-image]' +
                           '(' + res.link + '?delhash=' + res.deletehash + ')\n'
    