
# lib/auto-host-markdown-image.coffee

{drag} = require './drag'
SubAtom = require 'sub-atom'

module.exports = 
class AutoHostMarkdownImage
  config:
    hostFromYourGithubRepoInsteadOfImgur:
      type: 'boolean'
      default: no
    projectRelativePathToFolderForGithubImages:
      type: 'string'
      default: 'images'

  
  activate: ->
    @subs = new SubAtom
    
    @subs.add 'atom-workspace', 'dragend', 
        '.pane.active .tab-bar .sortable', (e) -> drag(e)
        
  deactivate: ->
    @subs.dispose()
    
module.exports = new AutoHostMarkdownImage
