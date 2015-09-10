# Write a method that receives a number 1 through 5.
# Depending on the value of the number, it will raise
# some particular type of exception.
#
# HINT:
#   All exceptions and errors are descendants of Exception.
#   (Exception is listed as an ancestor)
#
# Examples:
#   exception_raiser 1   # =>   #<RuntimeError: No 1s allowed!>
#   exception_raiser 2   # =>   #<ArgumentError: No 2s allowed!>
#   exception_raiser 3   # =>   #<Exception: No 3s allowed!>
#   exception_raiser 4   # =>   #<SyntaxError: No 4s allowed!>
#   exception_raiser 5   # =>   #<RubyKickstartException: No 5s allowed!>

RubyKickstartException = Class.new(RuntimeError)

ERRORS = {
  1 => RuntimeError,
  2 => ArgumentError,
  3 => Exception,
  4 => SyntaxError,
  5 => RubyKickstartException
}

def exception_raiser(number)
  error = ERRORS[number]
  raise error.new("No #{number}s allowed!") if error
end
