require_relative './Selection'
def run
  sl = Selection.new
  arr = gets.chomp.split(' ').to_a.map(&:to_i)
  puts "Origin: #{arr}"
  puts "Answer: #{arr.sort}"
  
  arr = sl.sort(arr)
  puts "Sorted: #{arr}"
  puts "Done!" if sl.sorted?(arr)
end

run