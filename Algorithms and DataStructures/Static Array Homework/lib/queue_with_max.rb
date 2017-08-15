# Implement a queue with #enqueue and #dequeue, as well as a #max API,
# a method which returns the maximum element still in the queue. This
# is trivial to do by spending O(n) time upon dequeuing.
# Can you do it in O(1) amortized? Maybe use an auxiliary storage structure?

# Use your RingBuffer to achieve optimal shifts! Write any additional
# methods you need.

require_relative 'ring_buffer'

class QueueWithMax
  attr_accessor :store, :length

  def initialize
    @queue = Array.new
  end

  def enqueue(val)
    @queue.push(val)
  end

  def dequeue
    @queue.shift
  end

  def max
    max = 0
    @queue.each { |el| max = el if el > max}
    max
  end

  def length
    @queue.length
  end

end
