# This class just dumbs down a regular Array to be statically sized.
class StaticArray

  def initialize(length)
    @store = Array.new(length)
  end

  def in_bounds?(index)
    raise "out of bounds" unless index >= 0 && index < @store.length
  end
  # O(1)
  def [](index)
    in_bounds?(index)
    @store[index]
  end

  # O(1)
  def []=(index, value)
    in_bounds?(index)
    @store[index] = value
  end

  protected
  attr_accessor :store
end


class StaticArray
  def initialize(capacity)
    @store = Array.new(capacity)
    @length = capacity
  end

  def [](i)
    # validate!(i)
    @store[i]
  end

  def []=(i, val)
    # validate!(i)
    @store[i] = val
  end

  def length
    @store.length
  end

  private

  def validate!(i)
    raise "Overflow error" unless i.between?(0, @store.length - 1)
  end
end
