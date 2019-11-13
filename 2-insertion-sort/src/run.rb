require_relative './Insertion'
require 'benchmark'
def run
  ins = Insertion.new
  arr = gets.chomp.split(' ').to_a.map(&:to_i)
  puts "Origin: #{arr}"
  puts "Answer: #{arr.sort}"
  
  bm = Benchmark.measure { arr = ins.sort(arr)}
  puts "Sorted: #{arr}"
  puts "BM: #{bm}" if ins.sorted?(arr)
end

run