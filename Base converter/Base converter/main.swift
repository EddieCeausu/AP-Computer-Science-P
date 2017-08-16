//
//  main.swift
//  Base converter
//
//  Created by Eddie Ceausu on 4/3/17.
//  Copyright © 2017 Edmond Ceausu. All rights reserved.
//
import Foundation
import Swift
import Darwin
// ********************************************************************
// Global Variables
// ********************************************************************
var done = false
var base: Int
var num: String
var num2: Int
var hex: String
var binary: Int
var response: String
// Foy's Inputs
func strinput() -> String { // reads string from console
    let keyboard = FileHandle.standardInput
    let inputData = keyboard.availableData
    let strData = NSString(data: inputData, encoding: String.Encoding.utf8.rawValue)!
    
    return strData.trimmingCharacters(in: CharacterSet.newlines)
}
// end of function strinput
func intinput() -> Int { // reads int from console
    let keyboard = FileHandle.standardInput
    let inputData = keyboard.availableData
    let strData = NSString(data: inputData, encoding: String.Encoding.utf8.rawValue)!
    strData.trimmingCharacters(in: CharacterSet.newlines)
    
    return Int (strData.intValue)
}
// end of function intinput & end of Foy's Inputs
// Functions
func sub(_ base: Int) -> String {
	var sub: String = ""

	if base == 1 {sub = "₁"}
	if base == 2 {sub = "₂"}
	if base == 3 {sub = "₃"}
	if base == 4 {sub = "₄"}
	if base == 5 {sub = "₅"}
	if base == 6 {sub = "₆"}
	if base == 7 {sub = "₇"}
	if base == 8 {sub = "₈"}
	if base == 9 {sub = "₉"}
	if base == 11{sub = "₁₁"}
	if base == 12{sub = "₁₂"}
	if base == 10 {sub = "₁₀"}
	if base == 16 {sub = "₁₆"}
	return sub
}
func tobase10(_ num: String,_ base: Int) { // Function will convert any base to base 10
	var j, c: Int
	let	obase = base
	let onum = num
	var set2 = [Int]()
	var set = num.characters.flatMap{Int(String($0))}
	for i in 0...set.count - 1 {
		c = set[i]
		if c >= obase { // error handling
			print("Invalid response")
			return
		}
	}
	set.reverse()
	for i in 0...set.count - 1 {
		c = set[i]
		j = Int(Double(c) * pow(Double(base), Double(i)))
		set2.append(j)
	}
	j = set2.reduce(0, +)
	let base = 10
	if j == nil { // error handling
		print("Unable to convert")
		return
	}
	print("\(j)\(sub(base)) = \(onum)\(sub(obase))")
	
}
func frombase10(_ base: Int,_ num2: Int){ // Function will convert base 10 to any other base
	let sub2 = String(8320 + 10); var set = [Int](); var j: Int; var count: Int = 0; var num = num2
	while num != 1 {
		j = num % base
		set.append(j)
		num = num / base
		if num == 1 {
			j = num % base
			set.append(j)
		}
		count += 1
		if count > 100000000 { // error handling
			print("Expression Error / number to large")
			return
		}
	}
	set.reverse()
	let setf = Int(set.map(String.init).reduce("", +))
	if setf == nil { // error handling
		print("Unable to convert / number to large")
		return
	};let obase = 10
	print("\(setf!)\(sub(base)) = \(num2)\(sub(obase))")
	//j = Int(String(num2, radix: 10), radix: base)!
///	print("\(j)\(sub(base)) = \(num2)\(sub(obase))")
}
func btohex(_ binary: String) {// converts binary to hex useing built in radix function to covnvert
	let hex = String(Int(binary, radix: 2)!, radix: 16)// declares binary value has a base of 2 and then converts to a base of 16
	print("x\(hex)\u{2081}\u{2086} = \(binary)\u{2082}")
}
func htobinary(_ hex: String) { // converts hex to binary through if statements and a for loop
	let binary =  String(Int(hex, radix: 16)!, radix: 2)

	print("\(hex)\u{2081}\u{2086} = \(binary)\u{2082}")
}
func additioninbase() { // converts each number to base 10; finds sum; converts back to original base

	var num, num2, num3, num4: String
	var set = [String]()
	var set2 = [Int]()
	var num_1: Int
	var num1f: String
	
	print("Please enter your base")
	let base = intinput()
	print("Please enter your numbers within base \(base)")
	num = strinput(); num2 = strinput(); num3 = strinput(); num4 = strinput()
	
	set.append(num);set.append(num2);set.append(num3);set.append(num4)

	for i in 0...3 {
		num = set[i]
		num_1 = Int(num, radix: base)!
		num1f = String(num_1, radix: 10)
		set2.append(Int(num1f)!)
	}

	let setf = set2.reduce(0, +)

	let num1 = Int(String(setf), radix: 10)!
	let num2f = String(num1, radix: base)
	print("Sum is:\(num2f)\(sub(base)) = \(num1)")
} // End Functions
func menu() -> Int { // End menu functions
    var userchoice: Int
    print(" ")
    print("- ************************* - ")
    print("- Conversion         Option - ")
    print("- To base 10              1 - ")
    print("- From base 10            2 - ")
    print("- Hex to Binary           3 - ")
    print("- Binary to Hex           4 - ")
    print("- Addition In Base        5 - ")
    print("- Quit                    0 - ")
    print("- ************************* - ")
    print(" ")
    print("Enter Option: ", terminator: "")
    userchoice = intinput()
    return userchoice
}// End menu
while !done { // While loop main menu
	let select = menu()
	switch(select) {
	
	case 0:
		print("Goodbye!")
		done = true
		break
		
	case 1:
		print("Please enter the number to convert")
		num = strinput()
		print("Please enter the current base")
		base = intinput()
		tobase10(num, base)
		break
		
	case 2:
		print("Please enter your Base 10 number")
		num2 = intinput()
		print("Please enter you desired base?")
		base = intinput()
		frombase10(base, num2)
		break
		
	case 3:
		print("Please enter you Hex value")
		hex = strinput()
		htobinary(hex)
		break
		
	case 4:
		print("Please enter your Binary value")
		var binary = strinput()
		btohex(binary)
		break
		
	case 5:
		additioninbase()
		break
		
	default: print("Pick a better number")
	} // end while loop
} // end program
