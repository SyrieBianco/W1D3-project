# Base Converter

# Write a recursive method that takes in a base 10 number n and
# converts it to a base b number. Return the new number as a string
#
# E.g. base_converter(5, 2) == "101"
# base_converter(31, 16) == "1f"
def base_converter(num, b)

end

# Binary search
# DO THIS ONE AGAIN FROM SCRATCH

class Array

  # Write a monkey patch of binary search:
  # E.g. [1, 2, 3, 4, 5, 7].my_bsearch(5) => 4
  def my_bsearch(target)

    middle = length / 2

    case self[middle] <=> target
    when 0
      return middle
    when 1
      return self.dup.take(middle).my_bsearch(target)
    when -1
      search_result = self.dup.drop(middle + 1).my_bsearch(target)
      search_result.nil? ? nil : middle + 1 + search_result
    end


  end

end

# Bubble Sort

class Array
  def bubble_sort!
    sorted = false

    until sorted
      sorted = true

      each_index do |i|
        next if i + 1 == length
        j = i + 1
        if self[i] > self[j]
          sorted = false
          self[i], self[j]= self[j], self[i]
        end
      end
    end

    self
  end

  def bubble_sort!(&prc)
    prc ||= Proc.new { |l, r| l <=> r}

    sorted = false

    until sorted
      sorted = true

      each_index do |i|
        next if i + 1 == length
        j = i + 1
        if prc.call(self[i], self[j]) == 0
          sorted = false
          self[i], self[j]= self[j], self[i]
        end
      end
    end

    self
  end

  def bubble_sort(&prc)
    self.dup.bubble_sort!(&prc)
  end
end

# Caesar Cipher

# Back in the good old days, you used to be able to write a darn near
# uncrackable code by simply taking each letter of a message and incrementing it
# by a fixed number, so "abc" by 2 would look like "cde", wrapping around back
# to "a" when you pass "z".  Write a function, `caesar_cipher(str, shift)` which
# will take a message and an increment amount and outputs the encoded message.
# Assume lowercase and no punctuation. Preserve spaces.
#
# To get an array of letters "a" to "z", you may use `("a".."z").to_a`. To find
# the position of a letter in the array, you may use `Array#find_index`.

def caesar_cipher(str, shift)

end

# Deep Dup

# Using recursion and the is_a? method,
# write an Array#deep_dup method that will perform a "deep" duplication of the interior arrays.

def deep_dup(arr)
return arr.dup if arr.none?{ |el| el.is_a?(Array)}
  each do |el|
    deep_dup(el) if el.is_a?(Array)
  end
end

# Digital Root

# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result, called the
# "digital root". **Do not use string conversion within your method.**
#
# You may wish to use a helper function, `digital_root_step(num)` which performs
# one step of the process.

def digital_root(num)
  n = num.dup
  while n > 10
    n = digital_root_step (n)
  end
  n
end

def digital_root_step(num)
  root = 0
  while num > 0
  root += (num % 10)
  num /= 10
  end
  root
end

#Doubler

# Write a method that doubles each element in an array
def doubler(array)
end

# Dups

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    dups = Hash.new { [] }
    each_with_index do |el, i|
      hash[el] += i if count(el) > 1
    end
    dups
  end
end

# Exponent

# return b^n recursively. Your solution should accept negative values
# for n
def exponent(b, n)
  case n
  when 0
  when n > 0
    b * exponent(b, n-1)
  when n < 0
    1.0 /b * exponent(b, n+1)
  end
end

# Factorials

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
end

# Factors
# Write a method that returns the factors of a number in ascending order.

def factors(num)

end

# Fibonacci sum
# Implement a method that finds the sum of the first n
# fibonacci numbers recursively. Assume n > 0
def fibs_sum(n)

end

# First Even Numbers

# return the sum of the first n even numbers recursively. Assume n > 0
def first_even_numbers_sum(n)

end

# Jumble_sort

# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

def jumble_sort(str, alphabet = nil)
  alphabet ||= ('a'..'z').to_a
  chars = string.chars
  sorted = false

  until sorted
    sorted = true
    chars.each_with_index do |ch, i|
      next if i + 1 == chars.length
      j = i + 1
      if alphabet.index(chars[i]) > alphabet.index(chars[j])
        chars[i], chars[j]= chars[j], chars[i]
        sorted = false
      end
    end
  end
  chars.join
end

# Median

# Write a method that returns the median of elements in an array
# If the length is even, return the average of the middle two elements
class Array
  def median
  end
end

# Merge Sort

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    prc ||= Proc.new { |l, r| l <=> r }
    return self if length < 2

    middle = length / 2

    left, right = take(middle), drop(middle)
    sorted_left, sorted_right = left.merge_sort(&prc), right.merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

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

# My all

class Array

  def my_all?(&prc)

  end

end


# My Any

class Array

  def my_any?(&prc)

  end

end


# My Each hash

class Hash

  # Write a version of my each that calls a proc on each key, value pair
  def my_each(&prc)

  end

end

# My each

class Array

  def my_each(&prc)

  end

  def my_each_with_index(&prc)

  end

end

# My Flatten

class Array

  # Takes a multi-dimentional array and returns a single array of all the elements
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,5]
  def my_flatten
    flat = []
    each do |el|
      el.is_a?(Array) ? flat += el.my_flatten : flat << el
    end
    flat
  end

  # Write a version of flatten that only flattens n levels of an array.
  # E.g. If you have an array with 3 levels of nested arrays, and run
  # my_flatten(1), you should return an array with 2 levels of nested
  # arrays
  #
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,[5]]
  def my_controlled_flatten(n)
    return self if n < 1
    result = []
    each do |el|
      if el.is_a?(Array)
        result += el
      else
        result << el
      end
    end
    result
  end

end


# My Inject

class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil)
  end
end


# My Join

class Array

  def my_join(str = "")

  end

end


# My Merge

class Hash

  # Write a version of merge. This should NOT modify the original hash
  def my_merge(hash2)

  end

end


# My Reject

class Array

  def my_reject(&prc)

  end

end


# My Reverse

class Array

  def my_reverse

  end

end


# My Rotate

class Array

  def my_rotate(num)

  end

end


# My Select

class Array

  def my_select(&prc)

  end

end


# Pig Latinify

# Write a method that translates a sentence into pig latin. You may want a helper method.
# 'apple' => 'appleay'
# 'pearl' => 'earlpay'
# 'quick' => 'ickquay'
def pig_latinify(sentence)
end


# Prime Factorization

# Write a recursive function that returns the prime factorization of
# a given number. Assume num > 1
#
# prime_factorization(12) => [2,2,3]
def prime_factorization(num)
  return [num] if is_prime?(num)
  (2..num).each do |fctr|
    if num % factor == 0
      return [fctr] + prime_factorization(num/factor)
end

def is_prime?(num)
  factors = (1..num).to_a.select { |fctr| num % fctr == 0 }
  factors.length <= 2
end


# Primes

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
end

def primes(num)
end


# Quicksort

class Array

  #Write a monkey patch of quick sort that accepts a block
  def my_quick_sort(&prc)
    prc ||= Proc.new { |l, r| l <=> r}
    return self if length < 2

    pivot = shift

    left = select { |el| prc.call(el, pivot) <= 0 }
    right = reject { |el| prc.call(el, pivot) <= 0 }

    left.my_quick_sort(&prc) + [pivot] + right.my_quick_sort(&prc)
  end

end


# Real Words in String

class String
  # Returns an array of all the subwords of the string that appear in the
  # dictionary argument. The method does NOT return any duplicates.

  def real_words_in_string(dictionary)

  end

  def substrings
    subs = []
    chars.each_index do |i|
      chars.each_index do |j|
        next if i == j
        
      end
    end
  end
end


# Recursive sum

# Write a recursive method that returns the sum of all elements in an array
def rec_sum(nums)
end


# String Include Key

# Write a recursive method that takes in a string to search and a key string.
# Return true if the string contains all of the characters in the key
# in the same order that they appear in the key.
#
# string_include_key?("cadbpc", "abc") => true
# string_include_key("cba", "abc") => false
def string_include_key?(string, key)

end


# Subsets

#returns all subsets of an array
def subsets(array)

end


# Symmetric Substrings

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
  end
end


#Titleize

# Write a method that capitalizes each word in a string like a book title
# Do not capitalize words like 'a', 'and', 'of', 'over' or 'the'
def titleize(title)
end


# Two_sum

class Array
  # Write a method, `Array#two_sum`, that finds all pairs of positions where the
  # elements at those positions sum to zero.

  # NB: ordering matters. I want each of the pairs to be sorted smaller index
  # before bigger index. I want the array of pairs to be sorted
  # "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def two_sum

  end
end
