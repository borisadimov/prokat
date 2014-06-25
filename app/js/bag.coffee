class Bike
  constructor: (@model, @img, @url) ->

hasStorage = () ->
  try
    @hasStorage = `'localStorage' in window && window['localStorage'] != null`
  catch e
    @hasStorage = false
  @hasStorage
do hasStorage

if @hasStorage
  @storage = require("js/storage")




module.exports = @hasStorage