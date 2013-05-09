# This works when we are in the directory
# require './article'
# require './merchant'

# This works from one directory out
# require './class_methods/article'
# require './class_methods/merchant'

# This works all the time -- but how?
# require_relative 'article'
# require_relative 'merchant'

full_path = File.expand_path(__FILE__)
dir_path = File.dirname(full_path)
# puts File.basename(path)
# puts "File: #{__FILE__}"

# require "#{dir_path}/article"
# require "#{dir_path}/merchant"

# puts "LOAD PATH: #{$:} #{$LOAD_PATH}"
$LOAD_PATH.unshift(dir_path) unless $LOAD_PATH.include?(dir_path)

require 'article'
require 'merchant'