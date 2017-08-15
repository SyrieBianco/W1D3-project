require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize(capacity = 8)
    @capacity = capacity
    @length = 0
    @start_idx = 0
    @store = StaticArray.new(@capacity)
  end

  # O(1)
  def [](index)
    check_index(index)
    @store[@start_idx + index]
  end

  # O(1)
  def []=(index, value)
    check_index(index)
    if index == @length
      resize!
      @length += 1
    end
    @store[@start_idx + index] = value
  end

  # O(1)
  def pop
    check_index(@start_idx)
    last_el = @store[@length]
    @length -= 1
    last_el
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize! if @length == @capacity
    @length += 1
    @store[@length] = val
    self
  end

  # O(n): has to shift over all the elements.
  def shift
    check_index(@start_idx)
    first_item = @store[@start_idx]
    @length -= 1
    @start_idx += 1
    first_item
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    resize! if @length == capacity
    @length += 1
    @start_idx = @start_idx - 1
    @store[@start_idx] = val
    self
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
    raise "index out of bounds" if @length == 0
    raise "index out of bounds" unless index < @length
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    new_store = StaticArray.new(@length * 2)
    i = 0
    while i < @length
      new_store[i] = @store[i]
      i += 1
    end
    @store = new_store
    @start_idx = 0
    @capacity = @length * 2
  end
end
