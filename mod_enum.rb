module Enumerable
  def my_template
    if self.class == Hash
      hash = self.to_a

    else
      arr = self.to_a

    end
  end

  def my_each
    if self.class == Hash
      hash = self.to_a
      for i in 0..hash.size-1
        yield(hash[i][0], hash[i][1])
      end
    else
      arr = self.to_a
      for i in 0..arr.length-1
        yield(arr[i])
      end
    end
  end

  def my_each_with_index
    if self.class == Hash
      hash = self.to_a
      for i in 0..hash.size-1
        yield(hash[i][0], hash[i][1], i)
      end
    else
      arr = self.to_a
      for i in 0..arr.length-1
        yield(arr[i], i)
      end
    end
  end

  def my_select
    if self.class == Hash
      hash = self.to_a
      hash2 = {}
      for i in (0..hash.size - 1)
        if yield(hash[i][0], hash[i][1]) == true
          hash2[hash[i][0]] = hash[i][1]
        end
      end
      return hash2
    else
      arr = self.to_a
      arr2 = []
      for i in 0..(arr.length - 1)
        if yield(arr[i]) == true
          arr2 << arr[i]
        end
      end
      return arr2
    end
  end

  def my_all?
    if self.class == Hash
      hash = self.to_a
      for i in (0..hash.size - 1)
        if yield(hash[i][0], hash[i][1]) != true
          return false
        end
      end
    else
      arr = self.to_a
      for i in 0..(arr.length - 1)
        if yield(arr[i]) != true
          return false
        end
      end
    end
    return true
  end

  def my_any?
    if self.class == Hash
      hash = self.to_a
      for i in (0..hash.size - 1)
        if yield(hash[i][0], hash[i][1]) == true
          return true
        end
      end
    else
      arr = self.to_a
      for i in 0..(arr.length - 1)
        if yield(arr[i]) == true
          return true
        end
      end
    end
    return false
  end
end

array = [1, 2, 3, 4, 5]
hash = {:key => "value", :alex => "Urbanski", :this => "is cool"}
array.my_each do |number|
  puts number
end
hash.my_each do |key, value|
  puts key
  puts value
end

newHash = hash.my_select do |key, value|
  key == :key
end
puts newHash
newArr = array.my_select do |num|
  num % 2 == 0
end
puts newArr

truthy = [2,4,6,8].my_all? do |num|
  num % 2 == 0
end
puts truthy

falsy = [2,3,6,8].my_all? do |num|
  num % 2 == 0
end
puts falsy

truthy = [2,4,6,8].my_any? do |num|
  num == 2
end
puts truthy

falsy = [2,3,6,8].my_any? do |num|
  num == 0
end
puts falsy
