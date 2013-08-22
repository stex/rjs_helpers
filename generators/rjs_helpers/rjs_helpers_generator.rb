class RjsHelpersGenerator < Rails::Generator::NamedBase
  def manifest
    record do |m|
      m.file File.join('assets', 'js', 'rjs_helper.js'), File.join('public', 'javascripts', 'rjs_helper.js')
    end
  end

  protected

  def banner
    "Usage: #{$0} rjs_helpers js"
  end
end
