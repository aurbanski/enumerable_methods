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

  def my_none?
    if self.class == Hash
      hash = self.to_a
      for i in (0..hash.size - 1)
        if yield(hash[i][0], hash[i][1]) == true
          return false
        end
      end
    else
      arr = self.to_a
      for i in 0..(arr.length - 1)
        if yield(arr[i]) == true
          return false
        end
      end
    end
    return true
  end

  def my_count
      count = 0
      #Check to see if the object is a hash
      if self.class == Hash

          #Convert to an array and start a for loop
          hash = self.to_a
          for i in 0..(hash.size - 1)

              #Have a statement store the result of the block only if a block
              #is given
              statement = yield(hash[i][0], hash[i][1]) if block_given?

              #If the block is given do this
              if statement != nil
                  #Only increment if the statement is true
                  if statement == true
                      count += 1
                  end
              #If no block is given, just give increment the count so that you
              #can return the size of the hash
              else
                count += 1
            end
          end
      #if the object is an array
      else
          arr = self.to_a
          for i in 0..(arr.length - 1)
              statement = yield(arr[i]) if block_given?

              if statement != nil
                 if statement == true
                     count += 1
                 end
              else
                 count += 1
              end
          end
      end
      return count
  end

  def my_map(&proc)
    if proc != nil
      if self.class == Hash
        hash = self.to_a
        hash2 = {}

        for i in 0..(hash.size - 1)
          element = proc.call(hash[i][0], [i][1])
          hash2[hash[i][0]] = element
        end

        return hash2
      else
        arr = self.to_a
        arr2 = []

        for i in 0..(arr.length - 1)
          element = proc.call(arr[i])
          arr2 << element
        end

        return arr2
      end
    else
      if self.class == Hash
        hash = self.to_a
        hash2 = {}

        for i in 0..(hash.size - 1)
          element = yield(hash[i][0], hash[i][1])
          hash2[hash[i][0]] = element
        end

        return hash2
      else
        arr = self.to_a
        arr2 = []

        for i in 0..(arr.length - 1)
          element = yield(arr[i])
          arr2 << element
        end

        return arr2
      end
    end
  end

  def my_map2(&proc)
    if self.class == Hash
      hash = self.to_a
      hash2 = {}

      for i in 0..(hash.size - 1)
        element = proc.call(hash[i][0], [i][1])
        hash2[hash[i][0]] = element
      end

      return hash2
    else
      arr = self.to_a
      arr2 = []

      for i in 0..(arr.length - 1)
        element = proc.call(arr[i])
        arr2 << element
      end

      return arr2
    end
  end

  def my_inject
    if self.class == Hash
      hash = self.to_a
      hash2 = {}

      for i in 0..(hash.size - 1)
        if i == 0

        else

        end
      end

      return hash2
    else
      arr = self.to_a

      for i in 0..(arr.length - 1)
        if i == 0
          element = arr[0]
        else
          element = yield(element, arr[i])
        end
      end

      return element
    end
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

#Test my_all?
truthy = [2,4,6,8].my_all? do |num|
  num % 2 == 0
end
puts truthy

falsy = [2,3,6,8].my_all? do |num|
  num % 2 == 0
end
puts falsy


#Test my_any?
truthy = [2,4,6,8].my_any? do |num|
  num == 2
end
puts truthy

falsy = [2,3,6,8].my_any? do |num|
  num == 0
end
puts falsy

#Test my_none?
truthy = [2,4,6,8].my_none? do |num|
  num == 0
end
puts truthy

falsy = [2,3,6,8].my_none? do |num|
  num == 2
end
puts falsy

#test my_count
truthy = [2,4,6,8].my_count
puts truthy

falsy = {:alex => "Urbanski", :my => "name is", :this => "is fun"}.my_count
puts falsy

truthy = [2,4,6,8].my_count do |num|
  num % 2 == 0
end
puts truthy

falsy = {:alex => "Urbanski", :my => "name is", :this => "is fun"}.my_count do |key, value|
  key == :alex
end
puts falsy

#test my_map
truthy = [2,4,6,8].my_map do |num|
  num * 2
end
puts truthy

falsy = {:alex => "Urbanski", :my => "name is", :this => "is fun"}.my_map do |key, value|
  value + "Hell yeah"
end
puts falsy

#test my_inject
truthy = [2,4,6,8].my_inject do |sum, num|
  sum * num
end
puts truthy

truthy = [2,4,6,8].my_inject do |sum, num|
  sum + num
end
puts truthy


#test my_inject using multiply_els
def multiply_els(arr)
  array = arr.my_inject do |sum, num|
    sum * num
  end
  return array
end

puts multiply_els([2,4,5])

#test my_map 2
my_proc = Proc.new{|num| num * 2}
truthy = [2,4,6,8].my_map(&my_proc)
puts truthy

my_proc = Proc.new{|key, value| value + "Hell yeah"}
falsy = {:alex => "Urbanski", :my => "name is", :this => "is fun"}.my_map(&my_proc)
puts falsy
