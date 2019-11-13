require_relative './Shell'
require 'benchmark'
def run
  sh = Shell.new
  arr = gets.chomp.split(' ').to_a.map(&:to_i)
  puts "Origin: #{arr}"
  puts "Answer: #{arr.sort}"
  
  bm = Benchmark.measure { arr = sh.sort(arr)}
  puts "Sorted: #{arr}"
  puts "BM: #{bm}" if sh.sorted?(arr)
end

run