# Quick Example of a Self Referential Data Structure in Ruby
# NODE -> contains a value and a pointer to (next_node)
# LinkedList -> This class holds the linked list functions - adding a node, traversing and displaying the linked list

class Node
   attr_accessor :value, :next_node

   def initialize(val,next_in_line=nil)
       @value = val
       @next_node = next_in_line
   end
end

class LinkedList
   def initialize(val)
       # Initialize a new node at the head
       @head = Node.new(val)
   end

   # Limited functionality for this add method:
   def add(value)
       # Traverse to the end of the list
       # And insert a new node over there with the specified value
       current = @head
       while current.next_node != nil
           current = current.next_node
       end
       current.next_node = Node.new(value,nil)
       self
   end

   # Limited functionality for this delete method:
   def delete(val)
       current = @head
       if current.value == val
           # If the head is the element to be delete, the head needs to be updated
           @head = @head.next_node
       else
           # ... x -> y -> z
           # Suppose y is the value to be deleted, you need to reshape the above list to :
           #   ... x->z
           # ( and z is basically y.next_node )
           current = @head
           while (current != nil) && (current.next_node != nil) && ((current.next_node).value != val)
               current = current.next_node
           end

           if (current != nil) && (current.next_node != nil)
               current.next_node = (current.next_node).next_node
           end
       end
   end

   def include?(key)
   end

   def size
   end

   def max
   end

   def to_s
       # Traverse through the list till you hit the "nil" at the end
       current = @head
       full_list = []
       while current.next_node != nil
           full_list += [current.value.to_s]
           current = current.next_node
       end
       full_list += [current.value.to_s]
      return full_list.join("->")
   end
end
