//
//  Roman & Decimal Converter
//
//  Created by deathlezz on 13/06/2021.
//

let decimal = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]

let roman = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]

func decimalToRoman(value: Int) -> String {     // decimal -> roman
    
    var result = ""
    var number = value
    
    while number > 0 {
        
        for (index, decimal) in decimal.enumerated() {
            
            if number - decimal >= 0 {

                result += roman[index]
                number -= decimal
                
                // print("Found \(roman[index]) for \(decimal)")

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

print(decimalToRoman(value: 2689))
print(romanToDecimal(value: "MCCXXXIV"))
