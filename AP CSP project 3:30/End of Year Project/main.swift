//
//  main.swift
//  End of Year Project
//
//  Created by Eddie Ceausu on 12/12/16.
//  Copyright © 2016 Eddie Ceausu. All rights reserved.
//

// *******************************************************************
// Imports
// *******************************************************************
import Foundation
import Swift
import Darwin
import Quartz
// ********************************************************************
// Global Variables
// ********************************************************************
var done = false
var done3 = false
var arraysize: Int
var upperlimit: UInt32
var yes = String("Y", "y", "Yes", "YES", "yes")
var no = String("N", "no", "NO", "n", "No", "nO")
var response: String
// ********************************************************************
//
// Function strinput returns a String which it reads from the Console
//
// ********************************************************************
func strinput() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let strData = NSString(data: inputData, encoding: NSUTF8StringEncoding)!
    
    return strData.stringByTrimmingCharactersInSet(NSCharacterSet.newlineCharacterSet())
} // end of function strinput
// ********************************************************************
//
// Function returns an integer which it reads from the Console
//
// ********************************************************************
func intinput() -> Int {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let strData = NSString(data: inputData, encoding: NSUTF8StringEncoding)!
    strData.stringByTrimmingCharactersInSet(NSCharacterSet.newlineCharacterSet())
    
    return Int (strData.intValue)
} // end of function intinput
// ********************************************************************
func Uintinput() -> UInt32 {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let strData = NSString(data: inputData, encoding: NSUTF8StringEncoding)!
    strData.stringByTrimmingCharactersInSet(NSCharacterSet.newlineCharacterSet())
    
    return UInt32 (strData.intValue)
} // end of function Uintinput
// ********************************************************************
func intinput32() -> Int32 {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let strData = NSString(data: inputData, encoding: NSUTF8StringEncoding)!
    strData.stringByTrimmingCharactersInSet(NSCharacterSet.newlineCharacterSet())
    
    return Int32 (strData.intValue)
} // end of function intinput32
// ********************************************************************
func intinput64() -> Int64 {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let strData = NSString(data: inputData, encoding: NSUTF8StringEncoding)!
    strData.stringByTrimmingCharactersInSet(NSCharacterSet.newlineCharacterSet())
    
    return Int64 (strData.intValue)
} // end of function intinput64
// ********************************************************************
//
// Function returns a Double which it reads from the Console
//
// ********************************************************************
func doubleinput() -> Double {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let strData = NSString(data: inputData, encoding: NSUTF8StringEncoding)!
    strData.stringByTrimmingCharactersInSet(NSCharacterSet.newlineCharacterSet())
    
    var dvalue: Double = 0
    
    dvalue = strData.doubleValue
    
    return dvalue
} // end of function doubleinput
// ********************************************************************
//
// Function readfile reads a file into a large array of strings
// each item in the array is a line from the file
//
// ********************************************************************
func readfile(path:String) -> [String]{
    do {
        // Read an entire text file into an NSString.
        let contents = try NSString(contentsOfFile: path, encoding: NSASCIIStringEncoding)
        let lines:[String] = contents.componentsSeparatedByString(",")
        
        return lines
    } catch {
        print("Unable to read file: \(path)");
        return [String]() }
}
//********************************************************************
// Functions
// ********************************************************************
func CustomSet() -> (set:[Double], arraysize:Int, upperlimit: UInt32) {
	var set: [Double]
	var j: Int
	print("How many numbers are in your data set: ", terminator: "")
	let arraysize = intinput(); set = [Double] (count: arraysize, repeatedValue: 0)

	print("Please enter your data:", terminator:"")
	
	for i in 0..<set.count {
		set[i] = doubleinput()
	}
	
	if set.count > 10000 {
		print("\r Sotring...")
	}
	set.sortInPlace()
	j = set.count
	let upperlimit = UInt32(set[j])
	
	return(set, arraysize, upperlimit)
}
func RandomSet() -> (set:[Double], arraysize:Int, upperlimit: UInt32) {
	var set: [Double]
	var upperlimit: UInt32
	var start, end: Double
	var path: NSURL
	let file: String
	let contents: String
	
	
	print("How many numbers are in your data set: ", terminator: "")
	let arraysize = intinput()

	print("Enter the Upperlimit of your random set: ", terminator: "")
	upperlimit = Uintinput()
	
	set = [Double] (count: arraysize, repeatedValue: 0)
	if arraysize >= 1000000 {
		print("\r Building...")
		
	}
	
	for i in 0 ..< arraysize {
		set[i] = Double(arc4random_uniform(upperlimit))
		
	}
	
	if set.count > 100000 {
		print("\r Sotring...")
		print(" ")
	}
	start = CACurrentMediaTime()
	set.sortInPlace()
	end = CACurrentMediaTime()
	print("Time to sort with .sortInPlace is \(round((end - start) * 1000) / 1000) sec")
	if set.count > 100000 {
		file = "random_data.txt"
		contents = String(set)
		if let directory = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first {
			path = NSURL(fileURLWithPath: directory).URLByAppendingPathComponent(file)
			print("Due to your file being larger than 100000 items, it was placed at: \(path)")
			//writing
			do {
				try contents.writeToURL(path, atomically: false, encoding: NSUTF8StringEncoding)
			}
			catch {print("Unable to write to: \(path)")}
		}
	}
	
	if set.count < 100000 {

	print("Would you like to print your random set? (Y/N) ")
	let response = strinput()
	
		if response == ("Y") {
			print(" ")
			print(set)
		}
	}
	return (set, arraysize, upperlimit)
}
func StandDev2_Variance(set: [Double]) {
	let average: Double
	var newaverage: Double
	var final, final2: Double
	
	average = set.reduce(0, combine: +) / Double(set.count)
	newaverage = set.map{pow($0 - average, 2.0)}.reduce(0, combine: +)
	final2 = newaverage / Double(set.count)
	final = sqrt(final2)
	
	print("Variance: \(round(final2 * 1000) / 1000)")
	print("Standard Deviation: \(round(final * 1000) / 1000)")
}
func MinandMax(set: [Double]) {
	let i = 0; let minnr = set[i]
	let j = set.count - 1; let maxnr = set[j]
	
	print("Max value: \(maxnr)")
	print("Min value: \(minnr)")
	print("Range: \(maxnr - minnr)")
}
func average(set: [Double]) {
	var average: Double
	var sum: Double
	average = set.reduce(0, combine: +) / Double(set.count)
	sum = set.reduce(0, combine: +)
	print("Sum: \(sum)")
	print("Average/Mean: \(round(average * 1000) / 1000) ")
}
func Median(set: [Double]) {
	var i, j: Int
	var m: Double
	
	if set.count % 2 != 0 {
		
		i = set.count / 2
		print("Median: \(set[i])")
	}
	
	if set.count % 2 == 0 {
		
		i = set.count / 2
		j = (set.count / 2) - 1
		m = set[i] + set[j]; m = m / 2
		print("Median: \(m)")
	}
}
func Mode(set: [Double], arraysize: Int, Upperlimit: UInt32) {
	if Int(Upperlimit) < arraysize {
		print("Mode will not be calculated")
		return
	}
	var set3 = [Double]()
	var j, k: Double
	var set2 = set
	var index = set.count
	set2.insert(0.0, atIndex: index)
	
	for i in 0...set.count - 1 {
		j = set2[i]
		k = set2[i + 1]
		
		if j == k {
			set3.append(j)
			
		}
	}
	//print(set3)
	j = 0; k = 0
	set2.removeAll()
	index = set3.count
	set3.insert(0.0, atIndex: index)
	let count = set3.count - 2
	
	for i in 0...count {
		j = set3[i]
		k = set3[i + 1]
		
		if j == k {
			set2.append(j)
			
		}
	}
	// Return statement if array is to large to display
	if set2.count > 50 {
		print("Mode is greater than 50 numbers")
		return
		
	}
	if set3.count > 50 {
		print("Mode is greater than 50 numbers")
		return
		
	}
// end > array return
	
	if set2.count == 0 {
		print("Mode: \(set3)")
			return
		}
	else {
			print("Mode: \(set2)")
			return
		}
}
func collatz(set: [Double]) {
	var set2 = [Double](); set2.removeAll()
	var set3 = [Double]()
	var n, t: Double
	var response: String
	var totaltime: Double
	var start, start2, end, end2: Double
	
	print("Would you like to print the process. Y/N")
	print("If N is chosen, average time per # & total time will be calculated")
	response = strinput()
	
	if response == "Y" {
		for i in 0...set.count - 1{
			n = set[i]
			set2.removeAll()
			sleep(UInt32(0.2))
			
			while n > 1 {
			
				if n == 1{
					set2.append(1.0)
				
				}
				if n % 2 == 1 {
					n = 3 * (n) + 1
					set2.append(n)
				
				}
				else {
					n = n / 2
					set2.append(n)
				
				}
				print(set2)
			}
		}//end for
	}// end if
		
	else { // will calculate total time and average time per array
		start = CACurrentMediaTime()
		set2.removeAll()
		
		for i in 0...set.count - 1{
			n = set[i]
			start2 = CACurrentMediaTime()
			
			while n >= 1 {
				
				if n == 1 {
					set2.append(n)
					break
					
				}
				if n % 2 == 1 {
					n = 3 * (n) + 1
					
				}
				else {
					n = n / 2
				}
			}
			end2 = CACurrentMediaTime()
			t = end2 - start2
			end2 = 0.0; start2 = 0.0
			set3.append(t)
			
		}// end for
		end = CACurrentMediaTime()
		totaltime = end - start
		
		print("Total time: \(totaltime)")
		print("Average time: \(set3.reduce(0, combine: +) / Double(set3.count))")
		
		print("Want Proof? Y/N")
		response = strinput()
		if response == yes {print(set2)}
	}// end else
}
func Medical(yes: String, no: String) {
	var age: String
	var gender: String
	var medication: String
}
// ********************************************************************
// Function menus returns an integer corresponding to user selection
// ********************************************************************
//Main Menu
func menu() -> Int
{
    var userchoice: Int
    print(" ")
    print("- ************************** -")
    print("- Operation           Option -")
    print("- Data Manipulation      1   -")
	print("- Medical                2   -")
    print("- Quit                   0   -")
    print("- ************************** -")
    print(" ")
    print("Enter Option: ", terminator: "")
    userchoice = intinput()
    return userchoice
}
// Equation and Laws Menu
func menu3() -> Int
{
    var userchoice: Int
    print(" ")
	print("- ************************** -")
	print("- Operation           Option -")
	print("- Load New Set           1   -")
	print("- Preform Statistics     2   -")
	print("- Quit                   0   -")
	print("- ************************** -")
    print(" ")
    print("Enter Option: ", terminator: "")
    userchoice = intinput()
    return userchoice
}
// ********************************************************************
// Various While loop realting to their specific Menu
// ********************************************************************
func DataManipulation(yes: String, no: String) {
	var arraysize: Int = 0
	var upperlimit: UInt32 = 0
	var response: String

	print("Welcome to the Statistics Function.")
	var set = [Double] (count: 0, repeatedValue: 0.0)
	print("\r Preparing to Load Set...")
	
	print(" ")
	print("Would you like to load a random or custom set? (R/C)")
	response = strinput()

	if response == ("R") {
		
		let array = RandomSet()
		set = array.set
		arraysize = array.arraysize
		upperlimit = array.upperlimit
	}
	
	if response == ("C") {
		
		let array = CustomSet()
		set = array.set
		arraysize = array.arraysize
		upperlimit = array.upperlimit
	}

while !done3 {
    let select = menu3()
    
    switch(select) {
        
	case 0: //Quit Case
		print(" ")
		print("Goodbye!")
		print(" ")
		done = true
		break
		
	case 1: // Load Array
		print(" ")
		print("Would you like to load a random or custom set? (R/C)")
		let response = strinput()
		
		if response == ("R") {
			set.removeAll()
			let array = RandomSet()
			set = array.set
			arraysize = array.arraysize
			upperlimit = array.upperlimit

		}
		else {
			set.removeAll()
			let array = CustomSet()
			set = array.set
			arraysize = array.arraysize
			upperlimit = array.upperlimit

		}
		break
	case 2: // Stats
		average(set)
		Median(set)
		Mode(set, arraysize: arraysize, Upperlimit: upperlimit)
		MinandMax(set)
		StandDev2_Variance(set)
		print("Would you like to do The Collatz conjecture on your set of numbers (Y/N)?")
		let response = strinput()
		if response == "Y" {
			collatz(set)
		}
		break
		
	default: print("Pick a better number")
        }
    }
}
// Data Menu
// ********************************************************************
while !done {
    let select = menu()
	
    switch(select) {
		
    case 0: //Quit Case
		print("Goodbye!")
		print(" ")
		done = true
        break
		
    case 1: // Main Data Manipulation
		DataManipulation(yes, no: no)
        done3 = false
        break
        
    case 2: // Main Medical
		Medical(yes, no: no)
        break
        
    default: print("Please pick a better number")
    }
} // Main Menu
// ********************************************************************/


