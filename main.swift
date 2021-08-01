//
//  Roman & Decimal Converter
//
//  Created by deathlezz on 18/06/2021.
//

// roman and decimal numbers array
let array: [( roman: String, decimal: Int )] = [
    ("M", 1000), ("CM", 900), ("D", 500), ("CD", 400),
    ("C", 100), ("XC", 90), ("L", 50), ("XL", 40),
    ("X", 10), ("IX", 9), ("V", 5), ("IV", 4), ("I", 1)]

// decimal -> roman
func decimalToRoman(value: Int) -> String {
    
    var result = ""
    var number = value
    
    while number > 0 {
        
        for (roman, decimal) in array {
            
            if number - decimal >= 0 {
                result += roman
                number -= decimal
                break
            }
        }
    }
    return result
}

// roman input error handling
enum RomanError: Error {
    case badInput
}

// roman -> decimal
func romanToDecimal(value: String) throws -> Int {
    
    var result = 0
    var number = value

    while number.count > 0 {
        
        var bool = false

        for (roman, decimal) in array {
            
            if number.starts(with: roman) {
                result += decimal
                number.removeFirst(roman.count)
                bool = true
                break
            }
        }
        
        if bool == false {             // throw error if bad input found
            throw RomanError.badInput
        }
    }
    return result
}

print("* Welcome to Roman & Decimal Converter *")

func converter() {

    print()
    print("Select operation:")
    print("[1] Decimal -> Roman")
    print("[2] Roman -> Decimal")

    if let userChoice = Int(readLine()!) {
        
        if userChoice == 1 {     // decimal -> roman
            
            func userInput() {
            
                print()
                print("Decimal:")
                
                if let input = Int(readLine()!) {
                
                    if input > 0 {
                    
                        print()
                        print("Roman:")
                        print(decimalToRoman(value: input))
                        return converter()
                        
                    } else {
                        print()
                        print("* Enter value bigger than 0 *")
                        return userInput()
                    }
                    
                } else {
                    print()
                    print("* Incorrect value *")
                    return userInput()
                }
            }
            userInput()
            
        } else if userChoice == 2 {     // roman -> decimal
            
            func userInput() {
            
                print()
                print("Roman:")
                
                let input = readLine()
                
                // call the function
                do {
                    let RTD = try romanToDecimal(value: input!)
                    print()
                    print("Decimal:")
                    print(RTD)
                    return converter()
                    
                } catch RomanError.badInput {     // bad input error
                    print()
                    print("* Incorrect value *")
                    return userInput()
                    
                } catch {                         // any other error
                    print()
                    print("* Unknown error found *")
                    return userInput()
                }
            }
            userInput()
            
        } else {
            print()
            print("* Enter 1 or 2 *")
            return converter()
        }
        
    } else {
        print()
        print("* Enter 1 or 2 *")
        return converter()
    }
}
converter()
