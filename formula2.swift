//
//  Roman & Decimal Converter
//
//  Created by deathlezz on 13/06/2021.
//


let dictionary: [( roman: String, decimal: Int )] = [
    ("M", 1000), ("CM", 900), ("D", 500), ("CD", 400),
    ("C", 100), ("XC", 90), ("L", 50), ("XL", 40),
    ("X", 10), ("IX", 9), ("V", 5), ("IV", 4),
    ("I", 1)]


func decimalToRoman(value: Int) -> String {     // decimal -> roman
    
    var result = ""
    var number = value
    
    while number > 0 {
        
        for (roman, decimal) in dictionary {
            
            if number - decimal >= 0 {
                result += roman
                number -= decimal
                break
            }
        }
    }
    return result
}


func romanToDecimal(value: String) -> Int {     // roman -> decimal
    
    var result = 0
    var number = value

    while number.count > 0 {

        for (roman, decimal) in dictionary {
            
            if number.starts(with: roman) {
                result += decimal
                number.removeFirst(roman.count)
                break
            }
        }
    }
    return result
}

print(decimalToRoman(value: 1234))
print(romanToDecimal(value: "MCCXXXIV"))
