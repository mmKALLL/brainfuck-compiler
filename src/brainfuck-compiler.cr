module Brainfuck
  VERSION = "0.1.0"
  extend self # Append functions to Brainfuck.self, so they can be called from outside the module.

  # Simple parsing of brainfuck. Output is done using comma-separated numeric values, differing from standard Brainfuck spec.
  def parse(input : String) : String
    position = 16384
    values = Array.new(32768, 0)
    output = ""
    read_character = false
    input.each_char do |char|
      if read_character
        read_character = false
        values[position] = char.ord # ord returns the ordinal codepoint
      else
        case char
        when '.'
          output += values[position].to_s + ","
        when '+'
          values[position] = (values[position] + 1) % 256
        when '-'
          values[position] = (values[position] - 1) % 256
        when '>'
          position += 1
          position = position % 32768
        when '<'
          position -= 1
          position = position % 32768
        when ','
          read_character = true
        end
      end
    end
    output
  end
end
