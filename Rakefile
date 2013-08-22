require 'rake'
require 'rake/testtask'
#require 'rdoc/task'

desc 'Default: run unit tests.'
task :default => :test

desc "Compiles the plugin's coffeescript to a js file"
task :make do |t|
  input_files      = ['./app/coffeescripts/']
  output_directory = './generators/rjs_helpers/templates/assets/js'

  input_files.each do |file|
    `coffee -l -c -o #{output_directory} #{file}`
  end
end

desc 'Test the rails_js_helpers plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end
