# You have two different problems to solve, you must get which one it is from a hash
# The default value for the hash should be :count_clumps
# If no hash is provided, choose count_clumps
#
# PROBLEM: count_clumps
# Say that a "clump" in an array is a series of 2 or more adjacent elements of the same value.
# Return the number of clumps in the given arguments.
#
# problem_14 1, 2, 2, 3, 4, 4, :problem => :count_clumps    # => 2
# problem_14 1, 1, 2, 1, 1,    :problem => :count_clumps    # => 2
# problem_14 1, 1, 1, 1, 1,    :problem => :count_clumps    # => 1
#
#
# PROBLEM: same_ends
# Return true if the group of N numbers at the start and end of the array are the same.
# For example, with [5, 6, 45, 99, 13, 5, 6], the ends are the same for n=0 and n=2, and false for n=1 and n=3.
# You may assume that n is in the range 0..nums.length inclusive.
#
# The first parameter will be n, the rest will be the input to look for ends from
# problem_14 1,   5, 6, 45, 99, 13, 5, 6,  :problem => :same_ends    # => false
# problem_14 2,   5, 6, 45, 99, 13, 5, 6,  :problem => :same_ends    # => true
# problem_14 3,   5, 6, 45, 99, 13, 5, 6,  :problem => :same_ends    # => false

def problem_14
end

def same_ends(end_length, *array)
  return true if end_length <= 0
  return false if end_length > array.length

  left_side = array.slice(0, end_length)
  right_side = array.slice(array.length - end_length, end_length)

  left_side.each_with_index do |el, index|
    return false if el != right_side[index]
  end

  true
end

def count_clumps(*numbers)
  last_number = nil
  clump_found = false
  clump_counts = 0

  numbers.each do |next_number|
    new_clump_found = last_number && (last_number == next_number) && !clump_found

    if new_clump_found
      clump_found = true
      clump_counts += 1
    elsif last_number != next_number
      clump_found = false
    end

    last_number = next_number
  end

  clump_counts
end
