#warm up

#1
def range (r_start, r_end)
  return [r_start] if r_end < r_start
  range(r_start.succ, r_end).unshift(r_start.succ)
end
##I tried to get this to work for letters to by using the .succ method, figured
#shouldn't waste too much time debugging the "warm-up"

#2
def rec_sum (arr)
  return arr.first if arr.length <= 1
  arr[0] + r_sum(arr[1..-1])
end

#3
def iter_sum (arr)
  arr.reduce(:+)
end


# Exponentiation



def exponent_1(b, e)
  return 1 if e.zero?
  b * exponent_1(b, e - 1)
end


def exponent_2(b, e)
  return 1 if e.zero?
  return b if e == 1
  if e.even?
    exponent_2(b, e / 2) * exponent_2(b, e / 2)
  else
    b * (exponent_2(b, (n - 1) / 2) * exponent_2(b, (n - 1) / 2))
  end
end

# Deep Dup

def deep_dup(arr)
  return arr.dup if arr.none? { |el| el.is_a?(Array) }
  arr.each do |el|
    next unless el.is_a?(Array)
    deep_dup(el)
  end
end

# Fibonacci

def rec_fib(n)
  seq = [0, 1]
  n <= 2 ? seq[0...n] : rec_fib(n-1) << rec_fib(n-1)[-2..-1].reduce(:+)
end
## when I have it print each recursion it repeats in a weird pattern.. why?
## does it mean my solution is inelegant?

def iter_fib(n)
  seq = [0, 1]

  return seq[0...n] unless n > 2

  until seq.length == n
    seq << seq[-1] + seq[-2]
  end

  seq
end

# Array Subsets

def array_subsets(arr)
  return [[]] if arr.length.zero?
  subsets = array_subsets( arr.take(arr.length - 1))
  subsets += subsets.map { |set| set + [arr.last] }
  subsets
end

# Permutations

def permutations(arr)
  return [arr] if arr.length == 1
  perms = permutations(arr[0...-1])
  p perms
  all_permutes = []
  perms.each do | perm |
    perm.each_index do | i |
      all_permutes << perm.insert(i, arr.last)
    end
  end

  all_permutes
end


#Binary search


def bsearch (array, target)
  return nil if array.empty?
  return nil unless array.include?(target)

  len = array.length
  mid_idx = len / 2
  right_side = array[mid_idx..-1]
  left_side = array[0...mid_idx]

  case target <=> array[mid_idx]
  when -1
    bsearch(left_side, target)
  when 0
    mid_idx
  when 1
    sub_answer = bsearch(right_side, target)
    sub_answer + left_side.length
  end

end


# p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil
