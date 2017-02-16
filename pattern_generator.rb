# Pattern Generator
#
# We want to generate serial numbers for our products as they roll off the manufacturing line. Patterns for the numbers are five characters like XXNXN where X stands for an uppercase letter A-Z and N stands for a digit 0-9.
#
# Write a program which, given a pattern like XXNXN, can both:
#
# generate all possible serial numbers for that pattern
# report out how many numbers were generated.
# Extensions
#
# Can you also support patterns of any length?
# Customers often confuse 0 and O, I and 1. Let's omit all four of those symbols from the generator.
require 'pry'

class Generator
  attr_reader :pattern

  def initialize(pattern)
    @pattern = pattern
    @current_serial = ""
    @combinations = {}
    @counter = 1
  end

  def store_serial_numbers
    @current_serial = generate_a_serial_number
    if @combinations.values.include?(@current_serial)
      @current_serial = generate_a_serial_number
    else
      @combinations[@counter] = @current_serial
      @counter += 1
    end
    store_serial_numbers

  end

  def generate_a_serial_number
    characters = pattern.chars
    sequence = []
    characters.map do |char|
      letters = ("A".."Z").to_a
      numbers = ("0".."9").to_a
      if char == "X"
        sequence.push(letters[0])
      elsif char == "N"
        sequence.push(numbers[0])
      end
    end
    return sequence.join
  end
end

Generator.new("XXNXN").store_serial_numbers
