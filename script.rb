# frozen_string_literal: true

# This module creates custom enumerables
module Enumerable
  def my_each
    i = 0
    while i < length
      yield self[i]
      i += 1
    end
  end

  def my_each_with_index
    i = 0
    while i < length
      yield self[i], i
      i += 1
    end
  end

  def my_select
    i = 0
    arr = []
    while i < length
      state = yield self[i]
      arr.push(self[i]) if state == true
      i += 1
    end
    arr
  end

  def my_all?
    i = 0
    arr = []
    while i < length
      state = yield self[i]
      arr.push(state) if state == true
      i += 1
    end
    return false if arr.length != self.length

    true
  end
end

puts 'my_each vs. each'
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
other_numbers = [2, 4, 6, 8]
puts 'my_each'
numbers.my_each { |item| puts item * 5 }
puts 'each'
numbers.each { |item| puts item * 5 }
puts 'my_each_with_index'
numbers.my_each_with_index { |item, i| puts "#{item} #{i}" }
puts 'each_with_index'
numbers.each_with_index { |item, i| puts "#{item} #{i}" }
puts 'my_select'
puts (numbers.my_select { |i| i.even?})
puts 'select'
puts (numbers.select { |i| i.even?})
puts 'my_all'
puts (numbers.my_all? { |i| i.even?})
puts 'all'
puts (numbers.all? { |i| i.even?})
puts 'my_all'
puts (other_numbers.my_all? { |i| i.even?})
puts 'all'
puts (other_numbers.all? { |i| i.even?})