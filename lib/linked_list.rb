# Defines a node in the singly linked list
class Node
  attr_reader :data # allow external entities to read value but not write
  attr_accessor :next # allow external entities to read or write next node

  def initialize(value, next_node = nil)
    @data = value
    @next = next_node
  end
end

# Defines the singly linked list
class LinkedList
  def initialize
    @head = nil # keep the head private. Not accessible outside this class
  end

  # method to add a new node with the specific data value in the linked list
  # insert the new node at the beginning of the linked list
  # Time Complexity: O(1)
  # Space Complexity: O(1)
  def add_first(value)
    if @head.nil?
      @head = Node.new(value)
    else
      new_node = Node.new(value, @head)
      @head = new_node
    end
  end

  # method to find if the linked list contains a node with specified value
  # returns true if found, false otherwise
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def search(value)
    if @head.nil?
      return false
    end

    current = @head
    while current != nil
      if current.data == value
        return true
      end

      current = current.next
    end

    return false
  end

  # method to return the max value in the linked list
  # returns the data value and not the node
  def find_max
    if @head.nil?
      return nil
    end

    max = @head.data
    current = @head
    while current != nil
      if max < current.data
        max = current.data
      end

      current = current.next
    end

    return max
  end

  # method to return the min value in the linked list
  # returns the data value and not the node
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def find_min
    if @head.nil?
      return nil
    end

    min = @head.data 
    current = @head 
    while current != nil 
      if min > current.data 
        min = current.data
      end

      current = current.next
    end

    return min
  end

  # method that returns the length of the singly linked list
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def length
    if @head.nil?
      return 0
    end

    length = 0
    current = @head 

    while current != nil
      length += 1

      current = current.next
    end

    return length
  end

  # method that returns the value at a given index in the linked list
  # index count starts at 0
  # returns nil if there are fewer nodes in the linked list than the index value
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def get_at_index(index)
    if @head.nil?
      return nil
    end

    count = 0
    current = @head 
    while current != nil 
      
      if count == index 
        return current.data
      end
      count += 1

      current = current.next
    end

    return nil
  end

  # method to print all the values in the linked list
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def visit
    if @head.nil?
      puts ""
    end

    current = @head 
    while current != nil
      puts current.data

      current = current.next
    end
  end

  # method to delete the first node found with specified value
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def delete(value)
    if @head.nil? 
      return 0
    end

    if @head.data == value 
      @head = @head.next
      return
    end

    current = @head 
    while current != nil
      if current.next.data == value 
        current.next = current.next.next
        return
      end

      current = current.next
    end
  end

  # method to reverse the singly linked list
  # note: the nodes should be moved and not just the values in the nodes
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def reverse
    current = @head 
    prev = nil 

    while current != nil 
      nextNodeLocation = current.next 
      current.next = prev 
      prev = current
      current = nextNodeLocation
    end

    @head = prev
  end

  ## Advanced Exercises
  # returns the value at the middle element in the singly linked list
  # Time Complexity: ?
  # Space Complexity: ?
  def find_middle_value
    raise NotImplementedError
  end

  # find the nth node from the end and return its value
  # assume indexing starts at 0 while counting to n
  # Time Complexity: ?
  # Space Complexity: ?
  def find_nth_from_end(n)
    raise NotImplementedError
  end

  # checks if the linked list has a cycle. A cycle exists if any node in the
  # linked list links to a node already visited.
  # returns true if a cycle is found, false otherwise.
  # Time Complexity: ?
  # Space Complexity: ?
  def has_cycle
    raise NotImplementedError
  end

  # Additional Exercises
    # Additional Exercises 
  # Additional Exercises
  # returns the value in the first node
  # returns nil if the list is empty
  # Time Complexity: O(1)
  # Space Complexity: O(1)
  def get_first
    if @head.nil?
      return nil
    end

    return @head.data
  end

  # method that inserts a given value as a new last node in the linked list
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def add_last(value)
    if @head.nil?
      @head = Node.new(value)
      return
    end

    current = @head
    while current.next != nil
      current = current.next
    end

    current.next = Node.new(value)
  end

  # method that returns the value of the last node in the linked list
  # returns nil if the linked list is empty
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def get_last 
  end

  # method to insert a new node with specific data value, assuming the linked
  # list is sorted in ascending order
  # Time Complexity: ?
  # Space Complexity: ?
  def insert_ascending(value)
    raise NotImplementedError
  end

  # Helper method for tests
  # Creates a cycle in the linked list for testing purposes
  # Assumes the linked list has at least one node
  def create_cycle
    return if @head == nil # don't do anything if the linked list is empty

    # navigate to last node
    current = @head
    while current.next != nil
      current = current.next
    end

    current.next = @head # make the last node link to first node
  end
end

