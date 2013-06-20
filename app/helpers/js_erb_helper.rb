module JsErbHelper
  #----------------------------------------------------------------
  #                    Helpers for js.erb files
  #     Have a look at app/coffeescripts/js_erb_helpers.coffee
  #----------------------------------------------------------------

  # Updates the content of the given selector with the given content
  #----------------------------------------------------------------------------
  def js_update_element(element, content)
    %{erbHelpers.updateElement("#{element}", "#{escape_javascript(rendered_content(content))}")}
  end

  # Like js_update_element, but with the element's dom_id
  #----------------------------------------------------------------------------
  def js_update_element_by_dom_id(element, content)
    %{erbHelpers.updateElementById("#{dom_id(*Array(element))}", "#{escape_javascript(rendered_content(content))}")}
  end

  # Appends the given content to the given element
  #--------------------------------------------------------------
  def js_append_element_to(element, content)
    %{erbHelpers.appendElementTo("#{element}", "#{escape_javascript(rendered_content(content))}")}
  end

  # Appends the given content to the given element
  #--------------------------------------------------------------
  def js_prepend_element_to(element, content)
    %{erbHelpers.prependElementTo("#{element}", "#{escape_javascript(rendered_content(content))}")}
  end

  # Replaces the given selector with the given content
  #----------------------------------------------------------------------------
  def js_replace_element(element, content)
    %{erbHelpers.replaceElement("#{element}", "#{escape_javascript(rendered_content(content))}")}
  end

  # Like js_replace_element, but with the element's dom_id
  #----------------------------------------------------------------------------
  def js_replace_element_by_dom_id(element, content)
    %{erbHelpers.replaceElementById("#{dom_id(*Array(element))}", "#{escape_javascript(rendered_content(content))}")}
  end

  # Removes the given element from the DOM
  #--------------------------------------------------------------
  def js_remove_element(element)
    %{erbHelpers.removeElement("#{element}")}
  end

  # Like +js_remove_element+, but with the element's dom_id
  #--------------------------------------------------------------
  def js_remove_element_by_dom_id(element)
    js_remove_element "##{dom_id(*Array(element))}"
  end

  # Removes the element from the DOM and displays an
  # effect from http://daneden.me/animate/
  #--------------------------------------------------------------
  def js_remove_with_css_effect(element, effect, delay = 500)
    %{erbHelpers.removeElementWithCSSEffect("#{element}", "#{effect}", #{delay})}
  end

  def js_redirect_to(url)
    %{erbHelpers.redirectTo('#{url_for(url)}')}
  end
  
  #----------------------------------------------------------------
  #                       Show / Hide / Toggle
  #----------------------------------------------------------------

  def js_show_element(element)
    %{erbHelpers.showElement("#{element}")}
  end

  def js_hide_element(element)
    %{erbHelpers.hideElement("#{element}")}
  end

  def js_show_element_by_dom_id(record)
    js_show_element("##{dom_id(*Array(element))}")
  end

  def js_hide_element_by_dom_id(record)
    js_hide_element("##{dom_id(*Array(element))}")
  end

  def js_toggle_element(element)
    %{erbHelpers.toggleElement("#{element}")}
  end

  private

  def rendered_content(content)
    if content.is_a?(Hash)
      if content[:partial]
        render(content)
      end
    else
      content
    end
  end
end
