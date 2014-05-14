###*
 * ScrollView illustrates the ability to intercept scroll events, pipe them through
 * an easing equasion, and then apply them to a container.  Useful in situations where
 * you would like to normalize scrolling across an unknown number of devices / platforms
 * and apply the result to a parallax container or typical webpage
 *
 * @author Christopher Pappas <chris@wintr.us>
 * @date   5.2.14
###

template = require './scroll-template.hbs'


class ScrollView extends Backbone.View


   # The easing which should be applied to inner container
   # @type {Number}

   FRICTION: .3


   # Number of individual items which are created within the container
   # @type {Number}

   NUMBER_OF_ITEMS: 60


   # Class name of the parent container
   # @type {String}

   className: 'container'


   # The next, computed position which is constantly being updated
   # inside of the render loop
   # @type {Number}

   nextPosition: 0


   # The current scroll position, which is applied via the keyframe
   # @type {Number}

   currentPosition:  0


   # The container in which to ease the scroll
   # @type {$}

   $scrollContainer: null




   initialize: -> @render()




   # Render the view by creating some dummy content which is then appended
   # to the dom for the scroll engine to calculate against.

   render: ->
      scrollItems = (_.range @NUMBER_OF_ITEMS).map (item, index) ->
         return name: "Item #{index}"

      $html = @$el.html template
         scrollItems: scrollItems

      $html.appendTo 'body'

      @$scrollContainer = @$el.find '.scroll-container'

      # Set the height of the main container so inner scroll
      # container, which is set to position:fixed, can still
      # be tied to an actual scrollbar

      @$el.height @$scrollContainer.height()

      @addEventListeners()
      @animationLoop()




   addEventListeners: ->
      $(window).on 'scroll', @onScroll




   # Handler for scroll events received when the scroll bar changes its
   # current position
   # @param {Event}

   onScroll: (event) =>
      @nextPosition = $(window).scrollTop()




   # The animation loop constantly inspects the current position of the scrollbar
   # and pipes it through an easing equasion.  This normalizes the scroll across
   # all scroll devices and allows for smooth scroll abilities within a normal
   # or parallax environment

   animationLoop: =>
      @currentPosition += ~~(@nextPosition - @currentPosition) * @FRICTION

      TweenMax.set @$scrollContainer,
         y: -@currentPosition

      requestAnimationFrame @animationLoop



module.exports = ScrollView