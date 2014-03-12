do ( $ = jQuery ) ->

  changeClassTransitional = ( el, cl, kind, options ) ->
    options = options or {}
    el[kind + "Class"]( cl )
    duration = 1000 * parseFloat( el.css( "transition-duration" ).slice( 0, -1 ), 10 )
    dfd = $.Deferred()
    
    if duration
      el.on "transitionend", ( event ) ->
        clearInterval( interval )
        dfd.resolveWith( el, [event] )
        el.off( "transitionend" )

    else
      dfd.resolveWith( el, [false] )
    
    return dfd.promise()


  # each method returns a promise that can be used with .then(), .done(), or .progress()
  $.fn.extend
    addClassTransitional: ( cl, options ) ->
      changeClassTransitional this, cl, "add"

    removeClassTransitional: ( cl, options ) ->
      changeClassTransitional this, cl, "remove"

    toggleClassTransitional: ( cl, options ) ->
      changeClassTransitional this, cl, "toggle"

