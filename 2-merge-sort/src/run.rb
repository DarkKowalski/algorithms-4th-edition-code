require_relative './Merge'
require 'benchmark'
def run
  mer = Merge.new

  arr_left = gets.chomp.split(' ').to_a.map(&:to_i)
  arr_right = gets.chomp.split(' ').to_a.map(&:to_i)
  puts "Left:         #{arr_left}"
  puts "Right:        #{arr_right}"

  arr = arr_left + arr_right
  puts "Whole:        #{arr}"

  puts "Left Sorted:  #{arr_left.sort}"
  puts "Right Sorted: #{arr_right.sort}"
  puts "Answer:       #{arr.sort}"
  
  bm = Benchmark.measure { arr = mer.sort(arr)}
  puts "Sorted:       #{arr}"
  puts "BM:           #{bm}" if mer.sorted?(arr)
end

run