
# lib/auto-host-markdown-image.coffee

{drag} = require './drag'
SubAtom = require 'sub-atom'

module.exports = 
class AutoHostMarkdownImage
  configDefaults:
    hostFromYourGithubRepoInsteadOfImgur: no
    projectRelativePathToFolderForGithubImages: 'images'
  
  activate: ->
    @subs = new SubAtom
    
    @subs.add '.workspace', 'dragend', 
        '.pane.active .tab-bar .sortable', (e) -> drag(e)
        
  deactivate: ->
    @subs.dispose()
    
module.exports = new AutoHostMarkdownImage
