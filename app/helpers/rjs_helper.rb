module RjsHelper
  #----------------------------------------------------------------
  #                    Helpers for js.erb files
  #     Have a look at app/coffeescripts/js_erb_helpers.coffee
  #----------------------------------------------------------------

  # Updates the content of the given selector with the given content
  #----------------------------------------------------------------------------
  def js_update_element(element, content)
    rjs_method :update_element, :element => element, :content => content
  end

  # Like js_update_element, but with the element's dom_id
  #----------------------------------------------------------------------------
  def js_update_element_by_dom_id(element, content)
    js_update_element(element, content)
  end

  # Appends the given content to the given element
  #--------------------------------------------------------------
  def js_append_element_to(element, content)
    rjs_method :append_element, :element => element, :content => content
  end

  # Appends the given content to the given element
  #--------------------------------------------------------------
  def js_prepend_element_to(element, content)
    rjs_method :prepend_element, :element => element, :content => content
  end

  # Replaces the given selector with the given content
  #----------------------------------------------------------------------------
  def js_replace_element(element, content)
    rjs_method :replace_element, :element => element, :content => content
  end

  # Like js_replace_element, but with the element's dom_id
  #----------------------------------------------------------------------------
  def js_replace_element_by_dom_id(element, content)
    js_replace_element(element, content)
  end

  # Removes the given element from the DOM
  #--------------------------------------------------------------
  def js_remove_element(element)
    rjs_method :remove_element, element
  end

  # Like +js_remove_element+, but with the element's dom_id
  #--------------------------------------------------------------
  def js_remove_element_by_dom_id(element)
    js_remove_element(element)
  end

  # Redirects the user to the given URL using javascript
  #--------------------------------------------------------------
  def js_redirect_to(url)
    rjs_method :redirect_to, url_for(url)
  end
  
  #----------------------------------------------------------------
  #                       Show / Hide / Toggle
  #----------------------------------------------------------------

  def js_show_element(element)
    rjs_method :show_element, element
  end

  def js_hide_element(element)
    rjs_method :hide_element, element
  end

  def js_show_element_by_dom_id(element)
    js_show_element(element)
  end

  def js_hide_element_by_dom_id(element)
    js_hide_element(element)
  end

  def js_toggle_element(element)
    rjs_method :toggle_element, element
  end

  private

  def rjs_method(func, element_or_options = {})
    if element_or_options.is_a?(Hash)
      element = options.delete(:element)
      content = options.delete(:content)
      args    = options.delete(:args)
    else
      element = element_or_options
      content = args = nil
    end

    if element.is_a?(ActiveRecord::Base) || element.is_a?(Array)
      elem = dom_id(*Array(element))
      js_function = "#{func}_by_id".camelize(:lower)
    else
      elem = element.to_s
      js_function = func.to_s.camelize(:lower)
    end
    js_args = []

    js_args << elem if elem

    #render content (if given)
    js_args << rendered_content(content) if content
    js_args += args

    %{rjsHelpers.#{js_function}(#{string_args(js_args)});}
  end

  def string_args(args)
    args.map {|a| "'#{a}'"}.join(', ')
  end


  # Processes the given content.
  # Strings are simply forwarded while Hashes
  # are passed to Rails' +render+ function.
  # Also, it automatically escapes javascript in the given content
  #--------------------------------------------------------------
  def rendered_content(content)
    escape_javascript(content.is_a?(Hash) ? render(content) : content)
  end
end
