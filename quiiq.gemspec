$:.unshift File.expand_path('../lib', __FILE__)
require 'date'

Gem::Specification.new do |s|
  s.name        = 'quiiq'
  s.version     = '0.0.2'
  s.date        = Date.today.to_s
  s.summary     = "Ruby QUIIQ wrapper."
  s.description = <<-desc
  		  Ruby wrapper for the QUIIQ web services layer (http://www.quiiq.com/).
  desc
  s.authors  = ["Tiago Franco"]
  s.email    = 'gama.franco@gmail.com'
  s.files    = `git ls-files -z`.split("\0")
  s.homepage = 'https://github.com/gamafranco/quiiq'
  s.rdoc_options     = %w[--charset=UTF-8]
  s.extra_rdoc_files = %w[README.md]
  s.require_paths    = %w[lib]

  s.required_rubygems_version = ">= 1.3.6"

  s.add_runtime_dependency 'savon', '~> 0.9'

end
