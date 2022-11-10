##
# Takes in a string, and shifts letters by a given key.
def caesar_cipher(string, key)
    # use map on split string, returning array that has shifted characters
    new_string_array = string.split("").map do |character|
        ascii_value = character.ord
        # rotate A-Z
        if ascii_value.between?(65, 90)
            rotate_chr(ascii_value, key, 65, 90)
        # rotate a-z
        elsif ascii_value.between?(97, 122)
            rotate_chr(ascii_value, key, 97, 122)
        # other characters, do nothing
        else
            character
        end
    end
    new_string_array.join
end

##
# Rotates ASCII value by a given key, wrapping around the lower or upper values.
def rotate_chr(ascii_value, key, lower, upper)
    key = key % 26
    # shift within A-Z or a-z
    if (ascii_value + key).between?(lower, upper)
        return (ascii_value + key).chr
    # right shift past Z or z
    elsif (ascii_value + key) > upper
        overflow = ascii_value + key - upper
        return (lower + overflow - 1).chr
    # left shift past A or a
    elsif (ascii_value + key) < lower
        underflow = ascii_value + key - lower
        return (upper + underflow + 1).chr
    end
end

puts "Enter a string to encode:"
str = gets.chomp
puts "How many characters do you want to shift by?\n(Positive value for right shift, negative for left shift)"
key = gets.chomp.to_i
puts "Here is your encoded string:"
puts caesar_cipher(str, key)