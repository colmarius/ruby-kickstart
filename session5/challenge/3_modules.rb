# Write a elements class. Implementation doesn't matter.
#
# elements = List.new
# elements << 1
# elements << 5
# elements << 3
# elements << 4
# elements << 2
# elements # => #<List: 1, 5, 3, 4, 2>
#
#
# Then give it an each method that iterates over its items in the order they were inserted
# ary = []
# ff.each do |crnt|
#   ary << crnt
# end
# ary # => [1, 5, 3, 4, 2]
#
#
# Then use the Enumerable module http://ruby-doc.org/core/classes/Enumerable.html to give
# your class its methods.
# ff.max                        # => 5
# ff.min                        # => 1
# ff.select { |num| num.odd? }  # => [1, 5, 3]

class List
  include Enumerable

  def initialize
    @elements = []
  end

  def <<(element)
    @elements << element
    self
  end

  def each(&block)
    @elements.each(&block)
  end

  def inspect
    pretty_elements = @elements.join(', ')
    "#<List: #{pretty_elements}>"
  end
end
