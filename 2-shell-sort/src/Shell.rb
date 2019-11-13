class Shell
  def sort!(arr)
    len = arr.length
    h = 1
    h = 3 * h + 1 while h < (len / 3)
    while (h >= 1)
      i = h
      (i...len).each do |i|
        j = i
        while j >= h && arr[j] < arr[j - h]
          exchange!(arr, j, j - h)
          j -= h
        end
      end
      h /= 3
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