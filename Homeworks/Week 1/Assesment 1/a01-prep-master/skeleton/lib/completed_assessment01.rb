require 'byebug'

class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil, &prc)
    accumulator = self.shift if accumulator.nil?
    self.each do |el|
      accumulator = prc.call(accumulator, el)
    end
    accumulator
  end
end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  factors = (1..num).to_a.select{ |fctr| num % fctr == 0}
  factors.length == 2
end

def primes(num)
  result = []
  idx = 0

  until result.length >= num
    result << idx if is_prime?(idx)
    idx += 1
  end
result
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [] if num.zero?
  arr = factorials_rec(num-1)
  arr << factorial(num-1)
end

def factorial(num)
  return 1 if num.zero?
  num * factorial(num-1)
end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    result = Hash.new() { [] }
    each_with_index { |el, idx| result[el] += [idx] if count(el) > 1 }
    result
  end

end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    substrings.select(&:symmetric?)
  end

  def substrings
    subs = []
    str_length_range = (2..length).to_a
    str_length_range.each do |str_len|
      chars.each_index do |i|
        subs << chars[i...i + str_len].join
      end
    end
    subs.uniq.select { |str| str.length > 1 }
  end


  def symmetric?
    self == reverse
  end


end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort (&prc)

    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

    return self if length < 2
    middle = length / 2

    left, right = self.take(middle), self.drop(middle)
    sorted_left, sorted_right = left.merge_sort(&prc), right.merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)

  end

  def self.merge(left_arr, right_arr, &prc)
    merged = []
    left = left_arr.dup
    right = right_arr.dup

    until left.empty? || right.empty?
      if prc.call(left.first, right.first) <= 0
        merged << left.shift
      else
        merged << right.shift
      end
    end
    merged + left + right
  end

end
