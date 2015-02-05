# Write a program that outputs the lyrics for "Ninety-nine Bottles of Beer on the Wall"
# Your program should print the number of bottles in English, not as a number. For example:
#
# Ninety-nine bottles of beer on the wall,
# Ninety-nine bottles of beer,
# Take one down, pass it around,
# Ninety-eight bottles of beer on the wall.
# ...
# One bottle of beer on the wall,
# One bottle of beer,
# Take one down, pass it around,
# Zero bottles of beer on the wall.
#
# Your program should not use ninety-nine output statements!
# Design your program with a class named BeerSong whose initialize method
# receives a parameter indicating the number of bottles of beer initially on the wall.
# If the parameter is less than zero, set the number of bottles to zero. Similarly,
# if the parameter is greater than 99, set the number of beer bottles to 99
# Then make a public method called print_song that outputs all stanzas from the number of bottles of beer down to zero.
# Add any additional methods you find helpful.

class EnglishNumber
  def initialize(number)
    @number = number
  end

  def to_s
    return NUMBERS_TO_ENGLISH[@number] if @number < 20

    numbers = @number.to_s.split('').map(&:to_i)
    decimal, digit = numbers

    if digit.zero?
      TENS_TO_ENGLISH[decimal]
    else
      "#{TENS_TO_ENGLISH[decimal]}-#{NUMBERS_TO_ENGLISH[digit]}"
    end
  end

  private

  NUMBERS_TO_ENGLISH = %w(zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen twenty)

  TENS_TO_ENGLISH = %w(_ ten twenty thirty forty fifty sixty seventy eighty ninety)
end

class BeerSong
  MIN_BOTTLES = 0
  MAX_BOTTLES = 99

  def initialize(bottles_count)
    @bottles_count = [MIN_BOTTLES, bottles_count, MAX_BOTTLES].sort[1]
  end

  def print_song
    return unless @bottles_count > 0

    @bottles_count.downto(1) do |remaining_bottles|
      puts song_phrase(remaining_bottles)
    end
  end

  protected

  def song_phrase(bottles)
    bottles_on_the_wall = bottles_word(bottles)
    bottles_on_the_wall_less_one = bottles_word(bottles - 1)

    <<-PHRASE
#{bottles_on_the_wall} of beer on the wall,
#{bottles_on_the_wall} of beer,
Take one down, pass it around,
#{bottles_on_the_wall_less_one} of beer on the wall.
    PHRASE
  end

  def bottles_word(bottles)
    number_word = EnglishNumber.new(bottles).to_s.capitalize
    bottles_word = bottles == 1 ? 'bottle' : 'bottles'

    "#{number_word} #{bottles_word}"
  end
end
