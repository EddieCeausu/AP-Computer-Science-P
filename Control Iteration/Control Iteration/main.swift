//
//  main.swift
//  Control Iteration
//
//  Created by Eddie Ceausu on 10/28/16.
//  Copyright © 2016 Eddie Ceausu. All rights reserved.
//

//: Playground - noun: a place where people can play

import Swift
import Foundation
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
    
    return Int (strData.intValue)
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

//  Exploration 0:  Change reference to "JOE FOY" above to your name and
//                  change revision 0 date to today's date
//  Exploration 1:  Run the code.  Notice that only 2 options have been
//                  coded so far, options 1 and 2.  What happens when you
//                  select Quit?
//  Exploration 2:  This code has an infinite loop in it.  Variable "done"
//                  should change value, so that when a user selects 0,
//                  the value of variable "done" changes.  Make this
//                  change in your code, test it
//  Exploration 3:  Write a for loop that scans through intarray.  If the
//                  present value of intarray is greater than the value of
//                  variable maxnr, update maxnr.  After the for loop
//                  completes, but still inside the if select == 3 brackets,
//                  print the maximum number and a description, e.g.
//                  Maximum number is 912
//  Exploration 4:  Repeat Exploration 3 but this time for the minimum
//                  number, which is option 4.  Use variable minnr
//  Exploration 5:  Write a for loop that adds up intarray values, when
//                  it is complete, print the sum with a description, e.g.
//                  Sum is 12943.  Calculation should use variable sum
//  Exploration 6:  Write a for loop that adds up intarray values, and
//                  then when it is complete, calculates and displays the
//                  average.  Calculation will use the sum and variable
//                  array size.  Display result with description
//  Exploration 7:  Write a for loop that prompts user for an integer that
//                  has a value between 0 and 1000, and then searches to
//                  see if that value is anywhere in array intarray. The
//                  search will use a for loop, and will set boolean value
//                  foundint to true if the number is found. The for loop
//                  should stop at the first occasion of finding the
//                  requested value.  After the for loop, use an if-else
//                  statement to print search results, print should be one
//                  of the following statements
//                  Value found    OR
//                  Value not found
// ********************************************************************
var x,select,rand, arraysize:Int
var sum: Double
var maxnr, minnr: Int
var average: Double
var done: Bool
var intarray: [Int]
var rdnumber: Int
done = false
arraysize = -1
maxnr = 10
minnr = 0

print("  Enter array size: ", terminator: "")
arraysize = intinput()

intarray = [Int] (count: arraysize, repeatedValue: 0)

while !done
{
    print("\nFunction \t\t Option")
    print("Load array  \t\t 1")
    print("Print array  \t\t 2")
    print("Find maximum\t\t 3")
    print("Find minimum\t\t 4")
    print("Calculate sum\t\t 5")
    print("Calculate avg\t\t 6")
    print("Search for nr\t\t 7")
    print("Quit         \t\t 0")
    print("Enter option: ", terminator: "")
    select = intinput()
    
    if (select == 1)
    {
        for (x = 0; x < arraysize; x += 1)
        {
            intarray[x] = Int(arc4random_uniform(10000000))
        }
    }  // end of select == 1

    if (select == 2)
    {
        for (x = 0; x < arraysize; x += 1)
        {
            if (x % 10 == 9) { print("\(intarray[x])\n")}
            else {print("\(intarray[x]) ", terminator: "")}
        } // end of for..
    } // end of select == 2
    
    
    // Exploration 2 code fills in the following if brackets
    if (select == 0)
    {
         done = true
    } // end of select == 0
    
    
    // Exploration 3 code fills in the following if brackets
    if (select == 3)
    {
        for x=0; x < arraysize; x += 1
        {
            if (intarray[x] > maxnr)
            {
                maxnr = intarray[x]
            }
            
        }
        print("Max value is: \(maxnr)")
    }  // end of select == 3
    
    // Exploration 4 code fills in the following if brackets
    if (select == 4)
    {
        for x=0; x < arraysize; x += 1
        {
         if (intarray[x] < minnr)
          {
               minnr = intarray[x]
            }
            
        }
        print("Min value is: \(minnr)")
        }  // end of select == 4
        // Exploration 5
    if (select == 5)
    {
        sum = 0
        for x=0; x < arraysize; x += 1
        {
           sum = sum + Double (intarray[x])
        }
        print("Your sum is: \(sum)")
    }
    if (select == 6)
    {
         sum = 0
         average = 0
         for x=0; x < arraysize; x += 1
         {
            sum = sum + Double (intarray[x])
            average = sum / Double (arraysize)
        }
        print("Average is: \(average)")
    }
    if (select == 7)
    {
        var run = false
        print("Please enter a number from 0 to 1,000:", terminator: "")
        rdnumber = intinput()
        
        while !run {
        for x=0; x < arraysize; x += 1
        {
            if(rdnumber == intarray[x])
            {
                print("Number \(rdnumber) found at \(x)")
                run = true
            }
        }
            if !run {print("Number not found");run = true}
        }
    }
    // add if statements and their code for Explorations 5 - 7 after this
    // comment, but still inside the while loop closing bracket
    
}   // end of while loop







