
# lib/auto-host-markdown-image.coffee

DummyItem = require './dummy-item'

module.exports = 
class AutoHostMarkdownImage
  configDefaults:
    autoOpenFileRegex: '-mdimg\.(jpeg|jpg|gif)$'
  
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
                         'Please correct and reload Atom.'
        buttons: ['Close']
      return

    if regex then atom.workspace.registerOpener (filePath) =>
      if regex.test(filePath) 
        editor = atom.workspace.getActivePaneItem()
        if editor?.getGrammar?()?.name is 'GitHub Markdown'
          new DummyItem filePath, editor

  destroy: -> atom.workspace.unregisterOpener @opener
      
module.exports = new AutoHostMarkdownImage
