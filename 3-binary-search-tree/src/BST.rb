class Node
  attr_accessor :key, :value, :left, :right, :count
  def initialize(k = nil, v = nil, n =nil)
    @key = k
    @value = v
    @left = nil
    @right = nil
    @count = n
  end
end

class BST
  def initialize
    @root = nil
  end

  def size(node = @root)
    return 0 if node.nil?
    node.count
  end

  def get(key)
    search(@root, key)
  end

  def put(key, value)
    @root = insert(@root, key, value)
  end

  def max_key
    max(@root).key
  end

  def min_key
    min(@root).key
  end

  def floor_key(key)
    temp_node = floor(@root, key)
    return nil if temp_node.nil?
    temp_node.key
  end

  def ceiling_key(key)
    temp_node = ceiling(@root, key)
    return nil if temp_node.nil?
    temp_node.key
  end
  
  def delete(key)
    @root = del_node(@root, key)
  end

  def delete_min
    @root = del_min(@root)
  end

  def select(rank)
    select_node(@root, rank).key
  end

  def rank(key)
    rank_node(@root, key)
  end

  private
  def del_min(node)
    return node.right if node.left.nil?

    node.left = del_min(node.left)
    node.count = size(node.left) + size(node.right) + 1
    
    node
  end

  def del_node(node, key)
    return nil if node.nil?
    # locate the node to be deleted
    if key < node.key
      node.left = del_node(node.left, key)
    elsif key > node.key
      node.right = del_node(node.right, key)
    else
      return node.left if node.right.nil?
      return node.right if node.left.nil?

      # temp_node: node to be deleted
      temp_node = node

      # node: replace deleted node
      node = min(temp_node.right)
      node.right = del_min(temp_node.right) # node.right == temp_node.right
      node.left = temp_node.left
    end

    node.count = size(node.left) + size(node.right) + 1
    
    node
  end

  def search(node, key)
    return nil if node.nil?

    if key < node.key
      return search(node.left, key)
    elsif key > node.key
      return search(node.right, key)
    end

    node.value
  end

  def insert(node, key, value)
    return Node.new(key, value, 1) if node.nil?

    if key < node.key
      node.left = insert(node.left, key, value)
    elsif key > node.key
      node.right = insert(node.right, key, value)
    else
      node.value = value # existing node, update value
    end

    # update node count after the insertion
    # bottom up
    node.count = size(node.left) + size(node.right) + 1

    node
  end

  def floor(node, key)
    return nil if node.nil?
    return node if node.key == key # hint

    return floor(node.left, key) if key < node.key
    
    temp_node = floor(node.right, key)
    return temp_node unless temp_node.nil? # hint
    
    node # floor node
  end

  def ceiling(node, key)
    return nil if node.nil?
    return node if node.key == key

    return ceiling(node.right, key) if key > node.key

    temp_node = ceiling(node.left, key)
    return temp_node unless temp_node.nil?

    node
  end

  def min(node)
    return node if node.left.nil?
    min(node.left)
  end

  def max(node)
    return node if node.right.nil?
    max(node.right)
  end

  def select_node(node, r)
    return nil if node.nil?

    t = size(node.left)
    if t < r
      return select_node(node.right, r - t - 1)
    elsif t > r
      return select_node(node.left, r)
    end

    node
  end

  def rank_node(node, key)
    return 0 if node.nil?
    if key < node.key
      return rank_node(node.left, key)
    elsif key > node.key
      return rank_node(node.right, key) + size(node.left) + 1
    end

    size(node.left)
  end

end