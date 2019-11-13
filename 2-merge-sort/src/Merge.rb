class Merge
  def initialize
    @aux = Array.new
  end

  def sort!(arr)
    merge_sort!(arr, 0, arr.length - 1)
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
  def merge_sort!(arr, lo, hi)
    return if hi <= lo
    mid = lo + (hi - lo) / 2
    arr[lo..mid] = arr[lo..mid].sort!
    arr[mid + 1..hi] = arr[mid + 1..hi].sort!
    merge!(arr, lo, mid, hi)
    arr
  end

  def merge!(arr, lo, mid, hi)
    i = lo
    j = mid + 1
    (lo..hi).each {|k| @aux[k] = arr[k]}
    (lo..hi).each do |k|
      if i > mid
        arr[k] = @aux[j]
        j += 1
      elsif j > hi
        arr[k] = @aux[i]
        i += 1
      elsif @aux[j] < @aux[i]
        arr[k] = @aux[j]
        j += 1
      else
        arr[k] = @aux[i]
        i += 1
      end
    end
    arr
  end

end