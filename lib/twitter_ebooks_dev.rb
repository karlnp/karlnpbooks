gem 'minitest'

$debug = false

def log(*args)
  STDERR.puts args.map(&:to_s).join(' ')
  STDERR.flush
end

module Ebooks
  GEM_PATH = File.expand_path(File.join(File.dirname(__FILE__), '..'))
  DATA_PATH = File.join(GEM_PATH, 'data')
  SKELETON_PATH = File.join(GEM_PATH, 'skeleton')
  TEST_PATH = File.join(GEM_PATH, 'test')
  TEST_CORPUS_PATH = File.join(TEST_PATH, 'corpus/0xabad1dea.tweets')
end

require_relative 'twitter_ebooks_dev/nlp.rb'
require_relative 'twitter_ebooks_dev/archive.rb'
require_relative 'twitter_ebooks_dev/markov.rb'
require_relative 'twitter_ebooks_dev/suffix.rb'
require_relative 'twitter_ebooks_dev/model.rb'
require_relative 'twitter_ebooks_dev/bot.rb'
