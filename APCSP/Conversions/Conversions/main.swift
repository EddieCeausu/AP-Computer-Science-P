//
//  main.swift
//  Conversions
//
//  Created by LOANER on 9/21/16.
//  Copyright © 2016 Eddie Ceausu. All rights reserved.
//

import Foundation
import Swift
//
// You should copy the following three functions into your
// future console based programs
//

// *******************************************************************
// Function strinput returns a String which it reads from the Console
//
// *********************************************************************

func strinput() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let strData = NSString(data: inputData, encoding: NSUTF8StringEncoding)!
    
    return strData.stringByTrimmingCharactersInSet(NSCharacterSet.newlineCharacterSet())
} // end of function strinput

// *********************************************************************
//
// Function intinput returns an integer which it reads from the Console
//
// *********************************************************************

func intinput() -> Int {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let strData = NSString(data: inputData, encoding: NSUTF8StringEncoding)!
    strData.stringByTrimmingCharactersInSet(NSCharacterSet.newlineCharacterSet())
    
    return Int(strData.intValue)
} // end of function intinput

// *********************************************************************
//
// Function doubleinput returns an integer which it reads from the Console
//
// *********************************************************************

func doubleinput() -> Double {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let strData = NSString(data: inputData, encoding: NSUTF8StringEncoding)!
    strData.stringByTrimmingCharactersInSet(NSCharacterSet.newlineCharacterSet())
    
    var dvalue: Double = 0
    
    dvalue = strData.doubleValue
    
    return dvalue
} // end of function doubleinput

// *********************************************************************

var outstring: String
var quotient,remainder: Int



outstring = ""
print("Enter Vaue:")
quotient = intinput()
//   prompt for an integer input which is to be converted to binary,
//   receive its value into an integer x

print("\n\n decimal \(quotient) in binary is")

//   following block of code is a “while loop”
//   so long as “quotient” is greater than 0, it will repeat itself
//   to avoid repeating endlessly (which is called “an infinite loop”), your
//   code must adjust the value of “quotient” inside the while loop


while (quotient > 0)
{
    //   Using the algorithm shown in class, calculate quotient and remainder
    //   print the remainder to the screen
    //   BE CAREFUL, OPPORTUNITY FOR INFINITE LOOP
    remainder = quotient%2
    quotient = quotient/2
    outstring = String(remainder) + outstring
    

    
}  //while x >=0
print("\(outstring)")
// after the basic program is working, you will add code here which prompts
// for a new integer, and then prompts for a base (new integer variable)
// You will then use the unique Swift string, radix method to convert the
// integer to base representation, then print the string to the console
// You will need: new integer declaration, string declaration


