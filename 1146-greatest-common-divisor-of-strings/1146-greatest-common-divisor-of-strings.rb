def gcd_of_strings(str1, str2)
    (str1 + str2 == str2 + str1) ? str1[0...str1.size.gcd(str2.size)] : ''
end