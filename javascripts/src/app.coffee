@Application = do (Backbone, Marionette) ->

  App = new Marionette.Application

  App.rootRoute = "dashboard"

  #App.on "initialize:before", (options) ->
    #@currentUser = App.request "set:current:user", options.current_user

  App.addRegions
    headerRegion: "#header-region"
    mainRegion: "#main-region"
    footerRegion: "#footer-region"

  App.addInitializer ->
    App.module("HeaderApp").start()
    App.module("FooterApp").start()

  App.on "initialize:after", ->
    if Backbone.history
      Backbone.history.start()
      @navigate(@rootRoute, trigger:true) if @getCurrentRoute() is ""
      console.log "**** started ****"

  App
