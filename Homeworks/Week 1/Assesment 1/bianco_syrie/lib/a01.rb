class Array
  # Write a new `Array#merge_sort` method; it should not modify the
  # array it is called on, but create a new sorted array.
  def merge_sort(&prc)
    prc ||= Proc.new { |l, r| l <=> r }
    return self if length < 2

    middle = length / 2

    left, right =  take(middle), drop(middle)
    sorted_left, sorted_right = left.merge_sort(&prc), right.merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)

  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      if prc.call(left[0], right[0]) <= 0
        merged << left.shift
      else
        merged << right.shift
      end
    end
    merged + left + right
  end

end

class Array
  # Write a new `Array#pair_sum(target)` method that finds all pairs of
  # positions where the elements at those positions sum to the target.

  # NB: ordering matters. I want each of the pairs to be sorted
  # smaller index before bigger index. I want the array of pairs to be
  # sorted "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def pair_sum(target)
    pairs = []
    each_index do |i|
      each_index do |j|
        next if i == j
        if (self[i] + self [j]) == target && i < j
          pairs << [i, j]
        end
      end
    end
    pairs
  end
end

# Write a method that recursively finds the first `n` factorial numbers
# and returns them. N! is the product of the numbers 1 to N.
# Be aware that the first factorial number is 0!, which is defined
# to equal 1. The 2nd factorial is 1!, the 3rd factorial is 2!, etc.
# The "calls itself recursively" spec may say that there is no method
# named "and_call_original" if you are using an older version of
# rspec. You may ignore this failure.
def factorials_rec(num)
  return [] if num.zero?
  factorials_rec(num-1) << factorial(num-1)
end

def factorial(num)
  return 1 if num.zero?
  num * factorial(num - 1)
end

class String
  # This method returns true if the string can be rearranged to form the
  # sentence passed as an argument.

  # Example:
  # "cats are cool".shuffled_sentence_detector("dogs are cool") => false
  # "cool cats are".shuffled_sentence_detector("cats are cool") => true

  def shuffled_sentence_detector(other)
    words = split
    other_words = other.split
    other_words.all? { |word| words.include?(word) }
    
  end
end

def is_prime?(num)
  factors = (1..num).to_a.select{ |fctr| (num % fctr).zero? }
  factors.length == 2
end

# Write a method that returns the nth prime number
def nth_prime(n)
  primes = []
  idx = 0
  until primes.length == n
    primes << idx if is_prime?(idx)
    idx += 1
  end
  primes.last
end

class Array
  # Write a method that calls a passed block for each element of the array
  def my_each(&prc)

    result = []
    idx = 0

      until result.length == length
        result << prc.call(self[idx])
        idx += 1
      end
    self

  end
end

class Array
  # Write an array method that calls the given block on each element and
  # combines each result one-by-one with a given accumulator. If no accumulator is
  # given, the first element is used.
  def my_inject(accumulator = nil, &prc)
    accumulator ||= self.shift
    each do |el|
      accumulator = prc.call(accumulator, el)
    end
  accumulator
  end
end
