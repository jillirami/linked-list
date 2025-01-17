
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
    # Time Complexity:  O(1)
    # Space Complexity: O(1)
    def add_first(value)
      node = Node.new(value, @head)
      @head = node
    end

    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    # Time Complexity:  O(n)
    # Space Complexity: O(1)
    def search(value)
      node = @head

      until node == nil
        if node == value
          return true
        else
          node = node.next
        end
      end

      return false
    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    # Time Complexity:  O(n)
    # Space Complexity: O(1)
    def find_max
      return nil if @head == nil

      node = @head
      max = node.data

      until node == nil
        if node.data > max
          max = node.data
        end
          node = node.next
      end

      return max
    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    # Time Complexity:  O(n)
    # Space Complexity: O(1)
    def find_min
      return nil if @head == nil

      node = @head
      min = node.data

      until node == nil
        if node.data < min
          min = node.data
        end
          node = node.next
      end

      return min
    end


    # method that returns the length of the singly linked list
    # Time Complexity:  O(n)
    # Space Complexity: O(1)
    def length
      length = 0
      node = @head

      until node == nil
        length += 1
        node = node.next
      end

      return length
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    # Time Complexity:  O(n)
    # Space Complexity: O(1)
    def get_at_index(index)
      value = nil
      node = @head
      i = 0

      until node == nil
        if i == index
          value = node.data
          break
        end
        node = node.next
        i += 1
      end

      return value
    end

    # method to print all the values in the linked list
    # Time Complexity:  O(n)
    # Space Complexity: O(1)
    def visit
      return nil if @head == nil
      node = @head

      until node == nil
        puts node.data
        node = node.next
      end
    end

    # method to delete the first node found with specified value
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def delete(value)
      node = @head

      until node == nil
        if node.data == value
          @head = node.next
          break
        elsif node.next.data == value
          node.next = node.next.next
          break
        end
        node = node.next
      end
    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def reverse
      # 3 (head) -> 2 (tail) -> nil
      return nil if !@head

      previous = nil
      current = @head

      until !current
        next_node = current.next # 2, nil
        current.next = previous # nil, 3 @head
        previous = current # 3 @head, 2
        current = next_node # 2, nil
      end

      @head = previous  #2
    end


    ## Advanced Exercises
    # returns the value at the middle element in the singly linked list
    # Time Complexity: O(2n) -> O(n)
    # Space Complexity: O(1)
    def find_middle_value
      return nil if !@head

      node = @head 

      length = self.length - 1
      length = (length / 2.0).ceil

      length.times do 
        node = node.next
      end

      return node.data
    end

    # find the nth node from the end and return its value
    # assume indexing starts at 0 while counting to n
    # Time Complexity: O(2n) -> O(n)
    # Space Complexity: O(1)
    def find_nth_from_end(n)
      length = self.length
      return nil if !(length > n)

      node = @head

      while n < length - 1
        node = node.next
        n += 1
      end

      return node.data
    end

    # checks if the linked list has a cycle. A cycle exists if any node in the
    # linked list links to a node already visited.
    # returns true if a cycle is found, false otherwise.
    # Time Complexity:
    # Space Complexity
    def has_cycle
      raise NotImplementedError
    end


    # Additional Exercises
    # returns the value in the first node
    # returns nil if the list is empty
    # Time Complexity: O(1)
    # Space Complexity: O(1)
    def get_first
      node = @head

      return node == nil ? nil : node.data
    end

    # method that inserts a given value as a new last node in the linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def add_last(value)
      node = @head

      if node == nil
        @head = Node.new(value)
      else
        until node.next == nil
          node = node.next
        end

        node.next = Node.new(value)
      end
    end

    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def get_last
      node = @head

      return nil if node == nil

      until node.next == nil
        node = node.next
      end

      return node.data
    end

    # method to insert a new node with specific data value, assuming the linked
    # list is sorted in ascending order
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def insert_ascending(value)
      node = @head

      if node == nil
        @head = Node.new(value)
      elsif node.data > value
        @head = Node.new(value, node)
      else
        while node.data < value
          if node.next != nil
            if node.next.data > value
              connected_node = node.next
              node.next = Node.new(value, connected_node)
              break
            end
            node = node.next
          else
            node.next = Node.new(value)
            break
          end
        end
      end
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