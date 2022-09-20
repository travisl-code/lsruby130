=begin

Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu

Names above are computing pioneers, names encrypted by Rot13. Write method to decipher and print names

Input: String of names on different lines
- Names are encrypted using rot13
Output: printed list of deciphered names

Examples (above)

Data Structures:
String of line-separated names
Array of names in line (for iteration)

String input for deciphering (Tenpr Ubccre)
Array of chars [T e n p r  U b c c r e]
Integers representing ASCII table

Algorithm:
split_names(string)

decipher_string(string)
Create empty results string
Create array of first 13 chars (A - M)
Create array of last 13 chars (N - Z)
Split string into chars. Iterate each char...
- If it's found in the first array, add 13 to the return of ASCII char position and get the new char
- If it's found in the 2nd array, subtract 13...
Return results


=end

def split_names(str)
  str.split("\n")
end

def decipher_string(str)
  first_half = ('A'..'M')
  second_half = ('N'..'Z')
  results = ''

  str.each_char do |char|
    ascii_position = char.ord
    if first_half.cover?(char.upcase)
      results << (ascii_position + 13).chr
    elsif second_half.cover?(char.upcase)
      results << (ascii_position - 13).chr
    else
      results << char
    end
  end

  results
end

names = "Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu"

names_arr = split_names(names)
names_arr.each do |name|
  puts decipher_string(name)
end
