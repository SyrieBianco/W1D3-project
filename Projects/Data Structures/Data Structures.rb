class Stack
  def initialize
    @stack =[]
  end

  def add(el)
    @stack.push(el)
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup
  end
end

class Queue
  def initialize
    @queue = []
  end

  def add(el)
    self.unshift(el)
  end

  def remove
    self.pop
  end

  def show
    p self
  end
end

class Map
  def initialize
    @map = []
  end

  def add(el)
    self.unshift(el)
  end

  def remove
    self.pop
  end

  def show
    p self
  end
end
