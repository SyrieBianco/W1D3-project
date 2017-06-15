require 'byebug'
class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil, &prc)
    accumulator = self.shift unless accumulator
    each do |el|
      accumulator = prc.call(accumulator, el)
    end
    accumulator
  end
end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  factors = (1..num).to_a.select { |el| num % el == 0 }
  factors.length == 2
end

def primes(num)
  prime_numbers = []
  idx = 0
  until prime_numbers.length == num
    prime_numbers << idx if is_prime?(idx)
    idx += 1
  end
  prime_numbers
end


# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num == 1
  factorials_rec(num-1) << factorial(num-1)
end

def factorial (n)
  return 1 if n.zero?
  n * factorial(n-1)
end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    hash = Hash.new { [] }
    each_with_index do |el, idx|
      hash[el] += [idx] if count(el) > 1
    end
    hash
  end
end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    substrings.select{ |el| el.symmetric? }
  end

  def substrings
    subs = []
    self.chars.each_index do |i|
      self.chars.each_index do |j|
        next if i == j
        subs << chars[i..j].join
      end
    end
    subs
  end

  def symmetric?
    length >= 2 && self == reverse
  end

end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    prc ||= Proc.new {|l,r| l <=> r }

    return self if length < 2

    middle = length / 2

    left, right = take(middle), drop(middle)
    sorted_left, sorted_right = left.merge_sort(&prc), right.merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  def self.merge(left_arr, right_arr, &prc)
    merged = []

    left, right = left_arr.dup, right_arr.dup

    until left.empty? || right.empty?
      if prc.call(left.first, right.first) <=0
        merged << left.shift
      else
        merged << right.shift
      end
    end
    merged + left + right
  end
end
