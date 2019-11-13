require_relative './Selection'
require 'benchmark'
def run
  sl = Selection.new
  arr = gets.chomp.split(' ').to_a.map(&:to_i)
  puts "Origin: #{arr}"
  puts "Answer: #{arr.sort}"
  
  bm = Benchmark.measure { arr = sl.sort(arr)}
  puts "Sorted: #{arr}"
  puts "BM: #{bm}" if sl.sorted?(arr)
end

run