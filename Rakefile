require 'rubygems'
require 'hoe'
require 'spec/version'
require 'spec/rake/spectask'
require './lib/esv_bible'

Hoe.new('esvbible', EsvBible::VERSION) do |p|
  p.rubyforge_name = 'esvbible' # if different than lowercase project name
  p.remote_rdoc_dir = ""
  p.developer('Geoffrey Dagley', 'gdagley@gmail.com')
end

task :default => :spec

desc "Run all specs"
Spec::Rake::SpecTask.new do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = ['--options', 'spec/spec.opts']
  unless ENV['NO_RCOV']
    t.rcov = true
    t.rcov_dir = 'coverage'
    t.rcov_opts = ['--exclude', 'lib/spec.rb,lib/spec/runner.rb,spec\/spec,bin\/spec,examples,\/var\/lib\/gems,\/Library\/Ruby,\.autotest']
  end
end