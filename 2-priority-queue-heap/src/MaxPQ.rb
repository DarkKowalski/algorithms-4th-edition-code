class MaxPQ
  attr_reader :size, :keys
  def initialize()
    @keys = Array.new
    @size = 0
  end

  def empty?
    size == 0
  end

  def insert(k)
    @size += 1
    @keys[@size] = k
    swim(@size)
  end

  def delete_max
    max = @keys[1]
    exchange(1, @size)
    @size -= 1
    sink(1)
    
    max
  end

  private
  def exchange(a, b)
    @keys[a], @keys[b] = @keys[b], @keys[a]
  end

  def less(a, b)
    @keys[a] < @keys[b]
  end

  def swim(k)
    while k > 1 && less(k / 2, k)
      exchange(k / 2, k)
      k /= 2
    end
  end

  def sink(k)
    while k * 2 <= @size
      j = k * 2
      j += 1 if j < @size && less(j, j + 1)
      break unless less(k, j)
      exchange(k, j)
      k = j
    end
  end
end