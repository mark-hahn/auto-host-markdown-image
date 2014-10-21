
# lib/auto-host-markdown-image.coffee

FilePaster = require './file-paster'

module.exports = 
class AutoHostMarkdownImage
  configDefaults:
    autoOpenFileRegex: '^mdimg-'
  
  activate: ->
    regexStr = atom.config.get 'auto-host-markdown-image.autoOpenFileRegex'
    try
      regex = new RegExp regexStr
    catch e
      atom.confirm
        message: 'Auto-host-markdown-image Error:\n\n'
        detailedMessage: 'The auto-open file regex setting is not a valid ' +
                         'regular expression: "' + regexStr + '"\n\n' +
                         'It must be a valid Javascript regex without the ' +
                         'surrounding slash characters.\n\n' +
                         'Please correct and reload Atom'.
        buttons: ['Close']
      return

    if regex then atom.workspace.registerOpener (filePath) =>
      # how to do this without opening new tab?
      if regex.text filePath then new FilePaster filePath
    
  destroy: -> atom.workspace.unregisterOpener @opener
      
module.exports = new AutoHostMarkdownImage
