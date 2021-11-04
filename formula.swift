//
//  Roman & Decimal Converter
//
//  Created by deathlezz on 13/06/2021.
//

// decimal numbers array
let decimal = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]

// roman numbers array
let roman = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]

// decimal -> roman
func decimalToRoman(value: Int) -> String {
    
    var result = ""
    var number = value
    
    while number > 0 {
        
        for (index, decimal) in decimal.enumerated() {
            
            if number - decimal >= 0 {

                result += roman[index]
                number -= decimal
                
                // print("Found \(roman[index]) for \(decimal)"
                break
            }
        }
    }
    return result
}

// roman -> decimal
func romanToDecimal(value: String) -> Int {
    
    var result = 0
    var number = value

    while number.count > 0 {

        for (index, roman) in roman.enumerated() {
            
            if number.starts(with: roman) {
                
                result += decimal[index]
                number.removeFirst(roman.count)
                
                // print("Found \(decimal[index]) for \(roman)")
                break
            }
        }
    }
    return result
}

print(decimalToRoman(value: 1234))     // MCCXXXIV
print(romanToDecimal(value: "MCCXXXIV"))     // 1234
