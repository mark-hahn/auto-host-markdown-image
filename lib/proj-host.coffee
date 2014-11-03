###
  lib\proj-host.coffee
###

fs       = require 'fs-plus'
pathUtil = require 'path'

module.exports = (editor, filePath) ->
  try
    mdDirPath = pathUtil.normalize pathUtil.dirname editor.getPath()
    imgRelDir = 
      atom.config.get 'auto-host-markdown-image.projectRelativePathToFolderForGithubImages'

    haveProjPath = no
    for projPath in atom.project.getPaths()
      if mdDirPath is projPath then haveProjPath = yes; break
      for subDirPath in fs.listTreeSync projPath
        if mdDirPath is pathUtil.normalize subDirPath
          haveProjPath = yes
          break
      if haveProjPath then break
    if not projPath
      throw new Error 'Unable to locate the project path for this markdown file.'
    
    pkgJson = fs.readFileSync (pathUtil.join projPath, 'package.json'), 'utf8'
    userRepo = /github\.com\/([^\/]+\/[^\/]+)(\/|$)/.exec JSON.parse(pkgJson).repository
    if not userRepo then throw new Error 'Unable to find a GitHub repo in a package.json file.'
    userRepoBranch = userRepo[1] + '/master'
    
    imgDir = pathUtil.join projPath, imgRelDir
    fs.makeTreeSync imgDir
    destFilePath = pathUtil.join imgDir, pathUtil.basename filePath
    fs.writeFileSync destFilePath, fs.readFileSync filePath
    
  catch e
    atom.confirm
      message: 'Error:'
      detailedMessage: 'There was an error copying the image file ' +
                        'to the project\'s image folder: \n\n' + e.message
      buttons: ['OK']
    return
    
  relpath = destFilePath[projPath.length+1..-1].replace /\\/g, '/'
  editor.insertText \ 
    '\n\n![Image inserted by Atom editor package auto-host-markdown-image](' + 
    "https://raw.githubusercontent.com/#{userRepoBranch}/#{relpath})\n\n"
        
  
  