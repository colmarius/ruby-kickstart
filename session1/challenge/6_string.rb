# You'll get a string and a boolean.
# When the boolean is true, return a new string containing all the odd characters.
# When the boolean is false, return a new string containing all the even characters.
# 
# If you have no idea where to begin, remember to check out the cheatsheets for string and logic/control
# 
# odds_and_evens("abcdefg",true)    # => "bdf"
# odds_and_evens("abcdefg",false)   # => "aceg"

def odds_and_evens(string, return_odds)
  return_odds ? odds_in(string) : evens_in(string)
end

def odds_in(string)
  select_chars(string) { |char, index| char if index.odd? }
end

def evens_in(string)
  select_chars(string) { |char, index| char if index.even? }
end

def select_chars(string, &block)
  string
    .each_char
    .each_with_index
    .select(&block)
    .map { |(char, _)| char }
    .join
end
