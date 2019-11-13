require_relative './UF'
require 'benchmark'

def run
  n = gets.to_i
  puts "#{n} nodes"

  uf = UF.new(n)
  bm = Benchmark.measure do
    input = ""
    until input[0] == "quit"
      input = gets.chomp.to_s.split(' ')
      p = input[0]
      q = input[1]
      next if uf.connected?(p.to_i, q.to_i)
      uf.union(p, q)
      puts "#{p} #{q}"
    end
  end

  puts "#{uf.count} components"

  puts "Index: #{(0...n).to_a}"
  puts "ID:    #{uf.id}"
  puts "Size:  #{uf.sz}"
  puts "BM: #{bm}"
end

run