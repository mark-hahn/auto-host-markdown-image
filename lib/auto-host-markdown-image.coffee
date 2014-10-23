
# lib/auto-host-markdown-image.coffee

{drag}    = require './drag'

module.exports = 
class AutoHostMarkdownImage
  configDefaults:
    autoOpenFileRegex: 'markdown\\.(jpeg|jpg|gif|png)$'
  
  activate: ->
    atom.workspaceView.on 'dragend', '.pane.active .tab-bar .sortable', (e) -> drag(e)

module.exports = new AutoHostMarkdownImage
