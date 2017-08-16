//
//  main.swift
//  Projectile Motion Design Project
//
//  Created by Eddie Ceausu on 8/29/16.
//  Copyright © 2016 Eddie Ceausu. All rights reserved.
//
import Swift
import Foundation
import Darwin
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

func herons()
{
    
    print("What would you like to have your decimal rounded to? ", terminator:"")
    
    var s: Double
    var s2: Double
    var s3: Double
    var a: Double
    var b: Double
    var c: Double
    print("Herons Formula Calculator")
    print("Please value of a: ", terminator:"")
    a = doubleinput()
    print("Please enter value of b: ", terminator:"")
    b = doubleinput()
    print("Please enter value of c: ", terminator:"")
    c = doubleinput()
    
    s2 = (a + b + c) / 2
    print("(\(a) + \(b) + \(c)) ÷ 2")
    print("Value of s: \(s2)")
    print("")
    s3 = s2 * (s2 - a) * (s2 - b) * (s2 - c)
    s = sqrt(s3)
    s = round(s*1000)/1000
    print("√(\(s2) * (\(s2) - \(a)) * (\(s2) - \(b)) * (\(s2) - \(c))")
    print("Area: \(s)" )
    //end Herons Formula
}
// *************************************************************
/*1
 func law_cos()  {
    var a:Double
    var b:Double
    var c:Double
    var C:Double
    var B:Double
    var A:Double
    
    print("Law of cosines calculator")
    print("For unknown angle enter 0")
    print("Please enter value of a:", terminator:"")
    a = doubleinput()
    print("Please enter value of b:", terminator:"")
    b = doubleinput()
    print("Please enter value of c:", terminator:"")
    c = doubleinput()
    pow(a, 2) = 

}*/

// **********************************************************************
func project_motion()
{
var angle: Double
var radians: Double
var initvelocity: Double
var vinitVert: Double
var vinitHoriz: Double
let π = 3.1415926
 var vinitHoriz2: Double
 var vinitVert2: Double
// end variables
//**********************************************************************
print("Please enter your angle value: ", terminator:"")
angle = doubleinput()
print("Please enter you inital velocity: ", terminator:"")
initvelocity = doubleinput()

//let DEGREESPERRADIAN = 0.017
//let RADIANSPERDEGREE = 57.296
let GACCEL = -10.0
//Degrees to Radians
    radians = angle * π / 180
 //End Degrees to radians

 vinitHoriz = initvelocity * cos(radians)
 vinitVert = initvelocity * sin(radians)

 vinitVert2 = initvelocity * sin(angle)
 vinitHoriz2 = initvelocity * cos(angle)
// Start Height calculation
    var height: Double
    
    height = -pow(vinitVert, 2) / (2 * GACCEL)
    
    height = round(height*1000)/1000
    print("Maximum Hight is: \(height) meters")
//End Height calculation

// Start Rise Time calculation
    var riseTime: Double
    
    riseTime = -vinitVert / GACCEL
    
    riseTime = round(riseTime*1000)/1000
    print("Rise time is: \(riseTime) seconds")
// End Rise Time Calculation

// Start Range calculation
    var range: Double
    
    range = vinitHoriz * 2 * riseTime
    
    range = round(range*1000)/1000
    print("Your Range is: \(range) meters")
// End Range calculation

// Start Total Time calculation
    var totalTime: Double
    
    totalTime = 2 * riseTime
    
    totalTime = round(totalTime*1000)/1000
    print("The total time the object is in the air is: \(totalTime) seconds.")
// End Total Time

// Start vertical & Horizontal final velocity
    var vfinalVert: Double
    vfinalVert = vinitVert + totalTime * GACCEL
    
vfinalVert = round(vfinalVert * 1000) / 1000
print("Vertical Final:\(vfinalVert)")
    
    var vfinalHotiz: Double
    vfinalHotiz = vinitHoriz

vfinalHotiz = round(vfinalHotiz * 1000) / 1000
print("Horizontal Final:\(vfinalHotiz)")
// End final Hortizontal & Vertical velocty

// Start final Velocity
    var vfinal: Double
    
    vfinal = sqrt(pow( vfinalHotiz, 2) + pow(vfinalVert, 2))
    
    vfinal = round(vfinal*1000)/1000
    print("Your final velocity is -\(vfinal) m/s.")
// End final Velocity

//start Extra credit
    var angleF: Double
    var angleFinal: Double
    
    angleF = atan(vfinalVert / vfinalHotiz)
    angleFinal = angleF * 180/π
    
    angleFinal = round(angleFinal*1000)/1000
    print("Your Final Angle is: \(angleFinal)°.")
// End Extra Credit
// End Project
}
func menu() ->Int32 // ->Int32 adds allows use of UI
{
    
    print("\nThird Swift program")
    print("Operation                 Selection")
    print("******************************")
    print("Project Motion               1")
    print("Herons Formula               2")
  //print("acii art                     3")
    return intinput()
}
var done: Bool = false
var x, y, z, a, b, c: Int32
var select:Int32 = 0
while !done
{
select = menu()
if select == 0 {done = true}
if select == 1 {project_motion()}
if select == 2 {herons()}
//if select == 3 {acii_art()}
if ((select < 0) || (select > 3)) {print("Must enter an integer  between 0 and 2")}
}


