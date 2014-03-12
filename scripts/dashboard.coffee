window.templatePaths =
  nav : "./templates/nav-pane.html"
  collection : "./templates/collection-pane.html"
  model : "./templates/model-pane.html"

window.panes = do ->
  nav : $( ".nav-pane" )
  collection: $( ".collection-pane" )
  model: $( ".model-pane" )

window.userData = undefined
window.templates = {}

$.getJSON( "./data.json" )
.done ( json ) ->
  window.userData = json
  checkReady()
.fail ( jqxhr, textStatus, error ) ->
    err = textStatus + ", " + error
    console.log( "Request Failed: " + err )

for key, path of templatePaths
  do ( key = key, path = path ) ->
    $.get path, ( template ) ->
      templates[key] = Handlebars.compile( template )
      saveTemplate( key, template )
      checkReady()

checkReady = ->
  # check if we have all the templates
  if Object.keys( templates ).length is Object.keys( templatePaths ).length
    # check if we have the user data
    if userData
      buildDashboard()

saveTemplate = ( name, contents ) ->
  unless localStorage.getItem( name )
    localStorage.setItem( name, contents )

buildDashboard = ->

  for category in userData.categories
    category.id = _.uniqueId( "collection-" )
    for model in category.models
      model.id = _.uniqueId( "model-" )

  panes.nav.html templates.nav( userData )

  for category in userData.categories
    panes.collection.append templates.collection( category )
    for model in category.models
      panes.model.append templates.model( model )

  $( "a[data-link-target]" ).click ->
    targetId = $( this ).attr( "data-link-target" )
    type = targetId.split( "-" )[0]

    console.log type

    target = $( "##{ targetId }" )

    # hide active model if moving to new category
    # should only work if CHANGING category
    if type is "collection"
      $( ".collection-pane__single" ).removeClass( "active" )

    $( ".model-pane__single" ).removeClass( "active" )
    target.addClass( "active" )

  return

