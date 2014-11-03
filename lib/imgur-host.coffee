
# lib/imgur-host.coffee

fs      = require 'fs'
request = require 'request'

imgur_client_id = '259065b16533101'

module.exports = (editor, filePath) ->

  options =
    url: "https://api.imgur.com/3/upload"
    method: 'POST'
    json:    yes
    body:
      type: 'base64'
      image: fs.readFileSync(filePath).toString 'base64'
      description: 'Uploaded by Atom editor package auto-host-markdown-image'
    headers:
      Authorization: 'Client-ID ' + imgur_client_id

  request options, (err, res, body) ->
    if err or body.status isnt 200
      atom.confirm
        message: 'Auto-host-markdown-image Error:\n\n'
        detailedMessage: 'Error uploading image to imgur: ' +
                          (err?.message ? '') + (body?.status ? '')
        buttons: ['Close']
      return
    
    console.log body
    
    editor.insertText \ 
      '\n\n![Image inserted by Atom editor package ' +
      'auto-host-markdown-image](' + body.data.link + ')\n\n'
