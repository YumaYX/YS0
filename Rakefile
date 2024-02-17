# frozen_string_literal: true

desc 'Test with act'
task :act do
  sh %(act -j test -W .github/workflows/test.yml 2>/dev/null | grep " - Main bundle exec rake test")
end

require 'rake/testtask'
task :test
Rake::TestTask.new do |t|
  t.test_files = FileList['test/test_*.rb']
  t.warning = true
end

require 'yard'
YARD::Rake::YardocTask.new do |t|
  t.files = FileList.new %w[lib/*.rb lib/**/*.rb]
  t.options += ['--output-dir', '_site']
end

require 'rubocop/rake_task'
RuboCop::RakeTask.new(:rubocop) do |t|
  t.patterns = %w[bin lib test Rakefile]
end

require 'rake/clean'
CLOBBER.include('testdata/*.json', 'input', '.yardoc', '_site')

task default: %i[test clobber yard]
