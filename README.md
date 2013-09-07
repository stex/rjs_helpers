RJS Helpers
==============

Some helper methods to perform standard JS library tasks from js.erb without having to write actual javascript

Installation
============

To install the plugin in your Rails 2.3 application, simply run

    ruby script/plugin install https://github.com/Stex/rjs_helpers.git
    
This will automatically load the Rails helper into all your controllers.
As explained below, the plugin ships with a default JS adapter for jQuery
which can be automatically copied to your public/javascripts directory with
the following line:

    ruby script/generate rjs_helpers js
    
Now you only have to include this js file into your application layout
and you're good to go.

Usage
=====

The plugin consists of two parts:

1. A Rails helper which is available in application views
2. A JS helper library which has to be included into your application scripts / layout

The JS file which is part of this plugin uses jQuery to perform its tasks.
If your application is using a different framework, feel free to write an 
own adapter for it.

The Rails helper does not directly generate code for just one library, as jQuery might
not be used for all applications. Instead, it will generate calls to an own API which can be
found in the included javascript file.

Available Functions
===================

Update, Replace, Append, Prepend
--------------------------------

These content update functions always take a selector element and the new content.

The selector element may either be a string/symbol which is passed directly to the JS function
or something the dom_id() function would take as well (an instance of ActiveRecord or an Array).

The content may either be a string containing the new content or options for the 
ActionView `render()` method.

    js_update_element(element, content)
    
Updates the given element with the given content

    js_replace_element(element, content)
    
Replaces the given element with the new content

    js_append_element_to(element, content)
    
Appends the given content to the given container element

    js_prepend_element_to(element, content)
    
Like `append`, but at the top of the container element


Removing DOM elements
---------------------

    js_remove_element(element)
    
Removes the given element from the DOM.


Show, Hide and Toggle
---------------------

    js_show_element(element)
    
Shows the given element, by default with `.show()`

    js_hide_element(element)
    
Hides the given element, by default with `.hide()`

    js_toggle_element(element)
    
Toggles the given element, by default with `.toggle()`


Various Actions
---------------

    js_redirect_to(url)

Performs a javascript redirect to the given URL. 
The argument may be everything that the `url_for()` function would accept, e.g. `[:admin, :users]` or `"http://www.google.com"`

    js_scroll_to(element, offset_top = 0)
    
Scrolls to the given element on the page.
The optional second parameter can be used to set a top offset. This is e.g. useful
if you have a fixed top navbar (greetings to you, bootstrap).

If `:top` is given as the first argument, the page will simply scroll to the very top (+ offset).









Examples
========
```ruby
= js_update_element @user, :partial => 'user', :object => @user
#=> rjsHelpers.updateElementByDomId('user_123', ...)
#=> jQuery('#user_123').html(...)

= js_update_element [@user, :emails], :partial => 'emails'
#=> rjsHelpers.updateElementByDomId('emails_user_123', ...)
#=> jQuery('#emails_user_123').html(...)

= js_hide_element '#myContainer'
#=> rjsHelpers.hideElement('#myContainer')
#=> jQuery('#myContainer').hide()

= js_replace_element '#willBeOverridden', 'And now for something completely different'
#=> rjsHelpers.replaceElement('#willBeOverridden', 'And now for something completely different')
#=> jQuery('#willBeOverridden').replaceWith('And now for something completely different')
```

Copyright (c) 2013 Stex, released under the MIT license
