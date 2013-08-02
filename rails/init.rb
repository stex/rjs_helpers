#Automatically include the js_erb helper in each controller
ActionController::Base.class_eval do
  helper :js_erb
end