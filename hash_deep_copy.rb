require 'active_support/core_ext/hash'

h1 = {:article => {:title => "War and Peace"}, :z => [7,8,9]}
# h2 = {:article => {:title => "50 shades"}, :z => "xyz"}

# puts h1.deep_merge(h2)
# puts h2.deep_merge(h1)

puts "Original: #{h1[:z]}"
h2 = h1.deep_dup
# Testing to see if the hash created in the dup is the same as the original.
h1[:z].push(10)
puts "Original: #{h1[:z]}"
puts "Extra Spicy: #{h2[:z]}"