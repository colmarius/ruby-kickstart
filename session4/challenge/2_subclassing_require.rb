# Require the stack code from challenge 1
# The code you added causes it to do this
#
# stack = Stack.new
# stack.push 1
# stack.push 2
# stack # => (2)1)


# But sometimes you want it to inspect like an array.
# stack # => [1, 2]
#
# Subclass the Stack class and override its inspect
# so that we can do this:
#
# stack = StackInDisguise.new
# stack.push 1
# stack.push 2
# stack # => [1, 2]

require_relative '1_stack_classes_inspect'

class StackInDisguise < Stack
  def inspect
    node = @head
    values = []
    while node
      values.push(node.data.inspect)
      node &&= node.next_node
    end
    "[#{ values.reverse.join(', ') }]"
  end
end
