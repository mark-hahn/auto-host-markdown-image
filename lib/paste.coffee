
# lib/paste.coffee

module.exports =
class Paste
  
  constructor: (filePath, editor) ->
    console.log 'Paste constructor', {filePath, editor}
    atom.workspace.getActivePane().activateItem editor
    editor.insertText 'Inserting: ' + filePath + ' in ' + editor.getTitle()
    