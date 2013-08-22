RJS Helpers
==============

Some helper methods to perform standard JS library tasks from js.erb without having to write actual javascript

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

Examples
========
```ruby
= js_update_element_by_dom_id @user, :partial => 'user', :object => @user
#=> jQuery('user_123').html(...)

= js_update_element_by_dom_id [@user, :emails], :partial => 'emails'
#=> jQuery('emails_user_123').html(...)

= js_hide_element '#myContainer'
#=> jQuery('#myContainer').hide()

= js_replace_element '#willBeOverridden', 'And now for something completely different'
#=> jQuery('#willBeOverridden').replace('And now for something completely different')
```

Copyright (c) 2013 Stex, released under the MIT license
