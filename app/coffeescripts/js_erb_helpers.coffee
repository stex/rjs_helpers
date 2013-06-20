#This file contains different helpers for js.erb files throughout the application.
#Using this methods allows us to be able to replace the underlying js framework

window.erbHelpers =

  # Updates the given selector with the given content
  #----------------------------------------------------------------------------
  updateElement: (element, content) ->
    jQuery(element).html(content)

  # Like updateElement, but the selector is interpreted as element ID
  #----------------------------------------------------------------------------
  updateElementById: (element, content) ->
    @.updateElement("##{element}", content)

  # Replaces the given selector with the given content
  #----------------------------------------------------------------------------
  replaceElement: (element, content) ->
    jQuery(element).replaceWith(content)

  # Like replaceElement, but the selector is interpreted as element ID
  #----------------------------------------------------------------------------
  replaceElementById: (element, content) ->
    @.replaceElement("##{element}", content)

  removeElement: (element) ->
    jQuery(element).remove()

  # First applies a css effect to the given element and
  # removes it from the DOM after the given time
  #--------------------------------------------------------------
  removeElementWithCSSEffect: (element, classes, delay) ->
    delay = 500 unless delay
    jQuery(element).addClass("animated #{classes}")
                   .delay(delay)
                   .queue () ->
                     jQuery(element).remove()

  # Appends the given content to the given element
  #--------------------------------------------------------------
  appendElementTo: (element, content) ->
    jQuery(element).append(content)

  prependElementTo: (element, content) ->
    jQuery(element).prepend(content)

  hideElement: (element) ->
    jQuery(element).addClass('hidden')

  showElement: (element) ->
    jQuery(element).removeClass('hidden')

  toggleElement: (element) ->
    jQuery(element).toggleClass('hidden')

  redirectTo: (url) ->
    window.location.href = url
