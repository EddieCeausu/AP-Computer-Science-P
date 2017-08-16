//
//  main.swift
//  Testing
//
//  Created by Eddie Ceausu on 10/21/16.
//  Copyright © 2016 Eddie Ceausu. All rights reserved.
//

import Foundation
import Swift
import Cocoa
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

func intinput() -> Int32 {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let strData = NSString(data: inputData, encoding: NSUTF8StringEncoding)!
    strData.stringByTrimmingCharactersInSet(NSCharacterSet.newlineCharacterSet())
    
    return strData.intValue
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
} // end of function intinput
// *********************************************************************
var actScore: Int32
var GPA: Double

print ("Enter ACT score: ", terminator: "")
actScore = intinput()
print("Enter GPA: ", terminator: "")
GPA = doubleinput()

if(actScore >= 21)||(GPA >= 3.0)
{
    print ("You got the Lottery Schol.")
}
    else
{
    print("NOpe")
}
if(GPA > 3.8)
{
if((actScore == 29)||(actScore == 28)&&(GPA == 3.8))
{
    print ("You got the Vols Schol.($3,000)")
}

if((actScore == 30)||(actScore == 31)||(actScore == 32)&&(GPA == 3.8))
{
    print ("You got the Vols Schol.($6,000)")
}

if((actScore == 34)||(actScore == 35)||(actScore == 36)&&(GPA == 3.8))
{
    print("You got the Vols Schol.($8,000")
}
}
else
{
    print("Sorry you didnt get the Vols Schol.")
}


// Write if statement(s) that determine scholarship amount based  upon provided
// ACT score and GPA.  Also include a print statement (or statements) that he\she
// is or is not eligible, and if eligible, the amount


