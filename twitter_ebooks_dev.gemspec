# -*- encoding: utf-8 -*-
require File.expand_path('../lib/twitter_ebooks_dev/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jaiden Mispy"]
  gem.email         = ["^_^@mispy.me"]
  gem.description   = %q{Markov chains for all your friends~}
  gem.summary       = %q{Markov chains for all your friends~}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "twitter_ebooks_dev"
  gem.require_paths = ["lib"]
  gem.version       = Ebooks::VERSION

  gem.add_runtime_dependency 'minitest'

  gem.add_runtime_dependency 'twitter', '~> 4.5'
  gem.add_runtime_dependency 'tweetstream', '= 2.5'
  gem.add_runtime_dependency 'rufus-scheduler'
  gem.add_runtime_dependency 'gingerice'
  gem.add_runtime_dependency 'htmlentities'
  gem.add_runtime_dependency 'engtagger'
  gem.add_runtime_dependency 'fast-stemmer'
  gem.add_runtime_dependency 'highscore'
end
