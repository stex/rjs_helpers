class QueryGeneratorGenerator < Rails::Generator::NamedBase
  def manifest
    record do |m|
      begin
        send("generate_#{name}", m)
      rescue
        banner
      end
    end
  end

  protected

  def banner
    "Usage: #{$0} rjs_helpers js"
  end

  private

  def generate_js
    m.file File.join('assets', 'js', 'rjs_helper.js'), File.join('public', 'javascripts', 'rjs_helper.js')
  end
end
