require_relative './BST'

def run
  bst = BST.new

  bst.put('c', "cat")
  bst.put('e', "egg")
  bst.put('a', "apple")
  bst.put('b', "banana")
  bst.put('f', "funk")
  puts "Add nodes: Done!"

  p bst.get('a')
  p bst.get('c')
  p bst.get('e')
  puts "Get nodes: Done!"

  p bst.max_key
  p bst.min_key
  puts "Get max|min key: Done!"

  p bst.ceiling_key('d')
  p bst.floor_key('d')
  puts "Ceiling|floor key: Done!"

  bst.delete_min
  p bst.min_key
  bst.delete('b')
  p bst.min_key
  puts "Delete nodes: Done!"

  p bst.select(bst.size() - 1)
  p bst.rank('f')
  puts "Select|rank: Done!"
end

run