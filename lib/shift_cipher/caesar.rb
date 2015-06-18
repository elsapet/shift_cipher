module ShiftCipher
  class Caesar
    attr_accessor :offset

    def initialize(start = 0)

      # set default
      @offset = 0

      # have we got a string?
      if start.respond_to?(:ord)

        # is it alphabetic?
        if ('A'..'Z').include?(start)
          @offset = start.downcase.ord - 97
        elsif ('a'..'z').include?(start)
          @offset = start.ord - 97

        # is it numeric & in range?
        elsif (1..26).include?(start.to_i.abs)
          @offset = start.to_i
        end

      # have we got a number
      elsif start.respond_to?(:to_i)
        # is it in range?
        if (1..26).include?(start.to_i)
          @offset = start.to_i
        end
      end

      # raise an error ... 
      # what about case when start set to 0?
    end

    def encrypt(message)
      shift(message, @offset)
    end

    def decrypt(message)
      shift(message, - @offset)
    end

    private
    def shift(message, directional_offset)
      shifted_message = ""
      message.downcase.split("").each do |character|
        if is_alpha?(character)
          shifted_character = shift_character(character, directional_offset)
          shifted_message += shifted_character
        elsif is_numeric?(character) or is_whitespace?(character)
          shifted_message += character
        end
      end if message
      shifted_message.squeeze(' ')
    end

    def is_alpha?(character)
      character.match(/^[[:alpha:]]$/)
    end

    def is_numeric?(character)
      character.match(/^[[:digit:]]$/)
    end

    def is_whitespace?(character)
      character.match(/^\s$/)
    end

    def shift_character(character, offset)
      shifted_ord = character.ord + offset
      if shifted_ord < 97
        shifted_ord = 123 - (97 - shifted_ord)
      elsif shifted_ord > 122
        shifted_ord = 97 + (shifted_ord - 123)
      end
      shifted_ord.chr
    end
  end
end