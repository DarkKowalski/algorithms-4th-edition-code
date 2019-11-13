class Insertion
  def sort!(arr)
    len = arr.length
    (1...len).each do |i|
      j = i
      temp = arr[j]
      while j > 0 && temp < arr[j - 1]
        arr[j] = arr[j - 1] # Right shift greater number
        j -= 1
      end
      arr[j] = temp # Insert
    end
    arr
  end

  def sort(arr)
    arr_copy = arr.clone
    sort!(arr_copy)
    arr_copy
  end

  def sorted?(arr)
    arr == arr.sort
  end

  private
  def exchange!(arr, i, j)
    arr[i], arr[j] = arr[j], arr[i]
  end
end