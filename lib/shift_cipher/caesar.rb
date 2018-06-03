module ShiftCipher
  class Caesar
    DEFAULT_OFFSET = 0

    FIRST_UNICODE_CODEPOINT = 97
    LAST_UNICODE_CODEPOINT = 123

    attr_accessor :offset

    def initialize(start = 0)
      @offset = calculate_offset(start)
    end

    def encrypt(message)
      shift(message, offset)
    end

    def decrypt(message)
      shift(message, -offset)
    end

    private

    def shift(message, directional_offset)
      return unless message

      message.downcase.split("").map do |character|
        if is_alpha?(character)
          character_for(character.ord + directional_offset)
        elsif is_numeric?(character)
          character
        end
      end.join("").squeeze(" ")
    end

    def calculate_offset(character)
      if ("A".."z").include?(character)
        character.downcase.ord - FIRST_UNICODE_CODEPOINT
      elsif (0..26).include?(character.to_i.abs)
        character.to_i
      else
        DEFAULT_OFFSET
      end
    end

    def is_alpha?(character)
      character.match(/^[[:alpha:]]$/)
    end

    def is_numeric?(character)
      character.match(/^[[:digit:]]$/)
    end

    # Given the shifted order for a char, returns the corresponding character
    # If the offset takes us past 123 ('z'), we wrap around to 97 ('A')
    #
    # Returns Char
    def character_for(unicode_codepoint)
      if unicode_codepoint < FIRST_UNICODE_CODEPOINT
        unicode_codepoint = LAST_UNICODE_CODEPOINT - (FIRST_UNICODE_CODEPOINT - unicode_codepoint)
      elsif unicode_codepoint >= LAST_UNICODE_CODEPOINT
        unicode_codepoint = FIRST_UNICODE_CODEPOINT + (unicode_codepoint - LAST_UNICODE_CODEPOINT)
      end
      unicode_codepoint.chr
    end
  end
end
