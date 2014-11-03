
# lib/auto-host-markdown-image.coffee

{drag}    = require './drag'

module.exports = 
class AutoHostMarkdownImage
  configDefaults:
    hostFromYourGithubRepoInsteadOfImgur: no
    projectRelativePathToFolderForGithubImages: 'images'
  
  activate: ->
    @subscription = atom.workspaceView.on 'dragend', 
        '.pane.active .tab-bar .sortable', (e) -> drag(e)
        
  deactivate: ->
    @subscription?.off()
    
module.exports = new AutoHostMarkdownImage
