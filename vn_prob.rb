#! /Users/jpkeane/.rvm/rubies/ruby-2.4.1/bin/ruby
require 'pry'
require 'optparse'

require_relative 'lib/trial'

options = {
  attempts: 1000,
  bias: 2
}
OptionParser.new do |opt|
  opt.on('-a', '--attempts ATTEMPTS', Integer) { |o| options[:attempts] = o }
  opt.on('-b', '--bias BIAS', Integer) { |b| options[:bias] = b }
end.parse!

t = Trial.new(options[:attempts], options[:bias])
puts t.output
