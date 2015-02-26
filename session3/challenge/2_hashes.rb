# Given a nonnegative integer, return a hash whose keys are all the odd nonnegative integers up to it
# and each key's value is an array containing all the even non negative integers up to it.
#
# Examples:
# staircase 1  # => {1 => []}
# staircase 2  # => {1 => []}
# staircase 3  # => {1 => [], 3 => [2]}
# staircase 4  # => {1 => [], 3 => [2]}
# staircase 5  # => {1 => [], 3 => [2], 5 =>[2, 4]}

def staircase(level)
  odds_upto(level)
    .each_with_object({}) do |odd_number, result|
      result[odd_number] = evens_upto(odd_number)
    end
end

def odds_upto(number)
  1.upto(number).select { |num| num.odd? }
end

def evens_upto(number)
  1.upto(number).select { |num| num.even? }
end
