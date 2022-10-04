# Write program when given word, computes Scrabble score for that word.

=begin

Letter scores:

Value: Letter
1: A, E, I, O, U, L, N, R, S, T
2: D, G
3: B, C, M, P
4: F, H, V, W, Y
5: K
8: J, X
10: Q, Z

How to Score:
Sum values of all tiles. Ex: cabbage = 14

3 + 2*1 + 2*3 + 2 + 1
=> 3 + 2 + 6 + 3
=> 5 + 9
=> 14


Input: String
- represents word
- can be single chars
- can be nil
- can contain non-alphabet chars
- can be upper/lowercase
- can be empty string
Output: Integer
- represents score of word (see above)

Examples:
street -> 6
f -> 4
a -> 1
quirky -> 22
`nil` -> 0
'' -> 0
" \t\n" -> 0

Data Structures:
String input: quirky
Scrabble class: Scrabble.new('quirky')
Score Hash: 

1: A, E, I, O, U, L, N, R, S, T
2: D, G
3: B, C, M, P
4: F, H, V, W, Y
5: K
8: J, X
10: Q, Z

Array of characters for word: [q u i r k y]
Accumulator (int): q -> 10, u -> 1, etc.
Integer output: 22

Algorithm:
Create class:
- initialization takes 1 arg
- evaluation method for calculating score
  - protect against non-string values (0 if non-string)
  - protect against non-alphabet chars
- `Scrabbe#score` should be a reader for the score
- Class should use a SCORE_KEY hash

`Scrabble#evaluate`
Initialize `total` to 0
Return `total` unless `@word` is String
Process word: only want A - Z chars
- substitute non alphabet chars for empty str
Split chars from processed word into array. Each char...
- Find char in SCORE_KEY hash.
- Update `total` with associated score
Assign total to `@score`

=end

class Scrabble
  attr_reader :score

  SCORE_KEY = {
    1 => %w(a e i o u l n r s t),
    2 => %w(d g),
    3 => %w(b c m p),
    4 => %w(f h v w y),
    5 => %w(k),
    8 => %w(j x),
    10 => %w(q z)
  }

  # CLASS METHOD

  def self.score(word)
    Scrabble.new(word).score
  end

  # INSTANCE METHODS

  def initialize(word)
    @word = word
    evaluate
  end

  private

  def evaluate
    unless @word.instance_of?(String)
      @score = 0
      return
    end

    processed = @word.gsub(/[^a-z]/i, '').downcase
    @score = calculate_score(processed)
  end

  def calculate_score(processed_word)
    total = 0
    
    processed_word.each_char do |char|
      SCORE_KEY.values.each do |char_set| 
        total += SCORE_KEY.key(char_set) if char_set.include?(char)
      end
    end

    total
  end

end

word = 'quirky'
sc_test = Scrabble.new(word)
p sc_test.score