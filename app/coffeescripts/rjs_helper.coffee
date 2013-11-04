#This file contains different helpers for js.erb files throughout the application.
#Using this methods allows us to be able to replace the underlying js framework

window.rjsHelpers =

  #----------------------------------------------------------------
  #                  Update / Replace Elements
  #----------------------------------------------------------------

  updateElement: (element, content) ->
    jQuery(element).html(content)

  updateElementById: (element, content) ->
    @.updateElement("##{element}", content)

  replaceElement: (element, content) ->
    jQuery(element).replaceWith(content)

  replaceElementById: (element, content) ->
    @.replaceElement("##{element}", content)


  #----------------------------------------------------------------
  #                        Remove Elements
  #----------------------------------------------------------------

  removeElement: (element) ->
    jQuery(element).remove()

  removeElementById: (element) ->
    @.removeElement("##{element}")

  #----------------------------------------------------------------
  #                        Append / Prepend
  #----------------------------------------------------------------

  appendElement: (element, content) ->
    jQuery(element).append(content)

  appendElementById: (element, content) ->
    @.appendElement("##{element}", content)

  prependElement: (element, content) ->
    jQuery(element).prepend(content)

  prependElementById: (element, content) ->
    @.prependElement("##{element}", content)


  #----------------------------------------------------------------
  #                        Show / Hide
  #----------------------------------------------------------------

  hideElement: (element) ->
    jQuery(element).hide()

  hideElementById: (element) ->
    @.hideElement("##{element}")

  showElement: (element) ->
    jQuery(element).show()

  showElementById: (element) ->
    @.showElement("##{element}")

  toggleElement: (element) ->
    jQuery(element).toggle()

  toggleElementById: (element) ->
    @.toggleElement("##{element}")

  #----------------------------------------------------------------
  #                          Scrolling
  #----------------------------------------------------------------

  scrollToElement: (element, offsetTop) ->
    offsetTop = 0 unless offsetTop?
    jQuery('html, body').animate({
      scrollTop: jQuery(element).offset().top - offsetTop
    }, 1000)
    false

  scrollToElementById: (element, offsetTop) ->
    offsetTop = 0 unless offsetTop?
    @.scrollToElement("##{element}", offsetTop)

  scrollToTop: (offsetTop) ->
    offsetTop = 0 unless offsetTop?
    jQuery("html, body").animate {scrollTop: offsetTop }, 600
    false

  #----------------------------------------------------------------
  #                           Various
  #----------------------------------------------------------------

  # Redirects to the given URL
  #--------------------------------------------------------------
  redirectTo: (url) ->
    window.location.href = url


