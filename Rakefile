require "bundler/gem_tasks"

desc "Compiles the plugin's coffeescript to a js file"
task :make do |t|
  input_files = ['./app/coffeescripts/']
  output_directory = './generators/rjs_helpers/templates/assets/js'

  input_files.each do |file|
    `coffee -l -c -o #{output_directory} #{file}`
  end
end
