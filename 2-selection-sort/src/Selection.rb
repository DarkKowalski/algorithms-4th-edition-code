class Selection
  def sort!(arr)
    len = arr.length
    arr.each_index do |i|
      min = i
      (i+1...len).each do |j|
        min = j if arr[j] < arr[i]
      end
      exchange!(arr, i, min)
    end
    arr
  end

  def sort(arr)
    arr_copy = arr
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