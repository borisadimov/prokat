class Storage

  counter: 0

  bikeArray: []

  constructor: () ->
    @.counter   = +(@getItem("counter"))
    if @getObject("bikeList")
      @.bikeArray = @getObject("bikeList")
    else
      @.bikeArray = []

  setObject: (key, value) ->
    localStorage.setItem key, JSON.stringify(value)

  getObject: (key) ->
    value = localStorage.getItem(key)
    JSON.parse(value)

  setItem: (key, value) ->
    localStorage.setItem key, value

  getItem: (key) ->
    localStorage.getItem(key)

  addBike: (bike) ->
    @counter += 1
    @bikeArray.push(bike)
    @setObject "bikeList", @bikeArray
    @setItem "counter", @counter

  removeBike: (bike)->
    index = @bikeArray.indexOf(bike)
    if index > -1
      @counter-=1
      @bikeArray.splice(index,1)
      @setObject "bikeList", @bikeArray
      @setItem "counter", @counter

  removeBikeByIndex: (index) ->
    if index > -1 and index < @bikeArray.length
      @counter-=1
      @bikeArray.splice(index,1)
      @setObject "bikeList", @bikeArray
      @setItem "counter", @counter

module.exports = new Storage