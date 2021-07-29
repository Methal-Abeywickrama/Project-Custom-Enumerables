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

  def my_none?
    i = 0
    while i < length
      state = yield self[i]
      return false if state == true

      i += 1
    end
    true
  end

  def my_count
    count = 0
    self.my_each_with_index { |_v, i| count += 1 if yield self[i] }
    count
  end
end

puts 'my_each vs. each'
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
even_numbers = [2, 4, 6, 8]
odd_numbers = [1, 3, 5, 7]

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
puts (even_numbers.my_all? { |i| i.even?})
puts 'all'
puts (even_numbers.all? { |i| i.even?})
puts 'my_none'
puts (numbers.my_none? { |i| i.even?})
puts 'none'
puts (numbers.none? { |i| i.even?})
puts 'my_none'
puts (odd_numbers.my_none? { |i| i.even?})
puts 'none'
puts (odd_numbers.none? { |i| i.even?})
puts 'my_count'
puts (numbers.my_count {|i| i.even?})
puts 'count'
puts (numbers.count {|i| i.even?})