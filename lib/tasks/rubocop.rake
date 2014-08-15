begin
  require 'rubocop/rake_task'
  task default: :rubocop
  RuboCop::RakeTask.new
rescue LoadError
  "it's ok"
end
