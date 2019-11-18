require_relative './MaxPQ.rb'
def run
  max_pq = MaxPQ.new
  arr = gets.chomp.split(' ').to_a.map(&:to_i)
  puts "Origin: #{arr}"

  arr.each_with_index do |v, i|
    max_pq.insert(v)
    puts "#{i + 1} Insert New(#{v}) #{max_pq.keys[1...arr.size]}"
  end

  puts

  arr.each_with_index do |_, i|
    m = max_pq.delete_max()
    puts "#{i + 1} Delete Max(#{m}) #{max_pq.keys[1...arr.size]}"
  end
end

run