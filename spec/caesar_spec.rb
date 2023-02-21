require './caesar'

describe '#rotate_chr' do
  it 'rotates character to the right when given a positive number' do
    ascii = 'a'.ord
    expect(rotate_chr(ascii, 2, 97, 122)).to eql('c')
  end
  it 'rotates character to the left when given a negative number' do
    ascii = 'C'.ord
    expect(rotate_chr(ascii, -2, 65, 90)).to eql('A')
  end
  it 'wraps characters going from z to a' do
    ascii = 'z'.ord
    expect(rotate_chr(ascii, 1, 97, 122)).to eql('a')
  end
  it 'properly rotates character when given a large number' do
    ascii = 'a'.ord
    expect(rotate_chr(ascii, 27, 97, 122)).to eql('b')
  end
end

describe '#caesar_cipher' do
  it 'rotates a string to the right' do
    expect(caesar_cipher('What a string!', 5)).to eql('Bmfy f xywnsl!')
  end
  it 'rotates a string to the left' do
    expect(caesar_cipher('hello there', -2)).to eql('fcjjm rfcpc')
  end
end