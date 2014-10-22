
# lib/dummy-item.coffee

{Emitter} = require 'emissary'
DummyView = require './dummy-view'

module.exports =
class DummyItem
  Emitter.includeInto @
  
  constructor: (@filePath, @editor) ->
    
  getFilePath:           -> @filePath
  getEditor:             -> @editor
  
  getTitle:              -> '~dummy tab~'
  getViewClass:          -> DummyView
  
