require 'pry'

class Generator
  attr_reader :pattern

  def initialize(pattern)
    @pattern = pattern
    @current_serial = ""
    @combinations = {}
    @counter = 1
    @total_count = []
  end

  def store_serial_numbers
    @current_serial = generate_a_serial_number
    if @combinations.values.include?(@current_serial)
      @current_serial = generate_a_serial_number
    else
      @combinations[@counter] = @current_serial
      @counter += 1
    end
    return @combinations if @combinations.keys.last == 26 * 26
    store_serial_numbers
  end

  def letters
    ("A".."Z").to_a
  end

  def numbers
    ("0".."9").to_a
  end

  def generate_a_serial_number
    sequence = []
    characters = pattern.chars
    characters.each do |char|
      if char == "X"
        @total_count.push(26)
        sequence.push(letters.sample)
      elsif char == "N"
        @total_count.push(10)
        sequence.push(numbers.sample)
      end
    end
    return sequence.join
  end
end

serials = Generator.new("XX").store_serial_numbers
puts serials.inspect
puts "# of possible combinations: {#{serials.keys.last}}"
