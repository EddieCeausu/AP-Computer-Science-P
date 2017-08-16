//  main.swift
//  FIle Ops
//
//  Created by Eddie Ceausu on 1/30/17.
//  Copyright © 2017 Eddie Ceausu. All rights reserved.
//
//  ASSUMED INPUT FILE AND ORGANIZATION
//  - header line or lines
//  - User specifies how many data lines
//  - each data line has 6 values, in order these are
//  - - local time
//  - - UTC time
//  - - ACPWR
//  - - estimated NOX reduction (lbs)
//  - - estimated CO2 reduction (lbs)
//  - - estimated SO2 reduction (lbs)
// ** Al Lots 10 arrays 1007 panels **\\


import Foundation
import Swift
import Darwin

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
func Uintinput() -> UInt32 {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let strData = NSString(data: inputData, encoding: NSUTF8StringEncoding)!
    strData.stringByTrimmingCharactersInSet(NSCharacterSet.newlineCharacterSet())
    
    return UInt32 (strData.intValue)
} // end of function intinput
// *********************************************************************
// *********************************************************************
func intinput32() -> Int32 {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let strData = NSString(data: inputData, encoding: NSUTF8StringEncoding)!
    strData.stringByTrimmingCharactersInSet(NSCharacterSet.newlineCharacterSet())
    
    return Int32 (strData.intValue)
} // end of function intinput
// *********************************************************************
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
//
// Function readfile reads a file into a large array of strings
//          each item in the array is a line from the file
//
// *********************************************************************
func readfile(path:String)->[String]
{
    do {
        // Read an entire text file into an NSString.
        let contents = try NSString(contentsOfFile: path, encoding: NSASCIIStringEncoding)
        let lines:[String] = contents.componentsSeparatedByString("\r")
        
        //       print(lines)
        return lines
    } catch {
        print("Unable to read file: \(path)");
        return [String]() }
}
// ********************************************************************
//
//  Function singleLine returns a single line from the array of lines
//  from a file.  User code will extract a field from this line to obtain
//  an actual data value
// ********************************************************************

func singleLine(linenum: Int, rowArray:[String])->[String]
{
    var linerow: [String]
    linerow = rowArray[linenum].componentsSeparatedByString(",")
    return linerow
    
} // end of singleLine
// ********************************************************************
func standardDeveation(array:[Double]) -> Double {
    let length = Double(array.count)
    let average = array.reduce(0, combine: +) / length
    let newarray = array.map{pow($0 - average, 2.0)}.reduce(0, combine: +)
    let final = sqrt(newarray / length)
    return(final)
}
// ********************************************************************
//  Function loadarrays loads two arrays
//  - daily AC power values
//  - daily CO2 values
//  It is called with the following variables
//  - filelines
//  - nrdays
//  It returns a tuple of PWRarray and CO2array, each has nrdays values
// ********************************************************************

func loadArrays(filelines:[String],nrdays:Int)->(PWRarray:[Double],CO2array:[Double], SO2array: [Double], NOXarray: [Double])
{
    var linestring: [String]
    var PWRarray = [Double] (count: nrdays, repeatedValue: 0.0)
    var CO2array = [Double] (count: nrdays, repeatedValue: 0.0)
    var SO2array = [Double] (count: nrdays, repeatedValue: 0.0)
    var NOXarray = [Double] (count: nrdays, repeatedValue: 0.0)
    
    
    for days in 0...nrdays - 1
    {
        linestring = singleLine(days,rowArray:filelines)
        PWRarray[days] = Double(linestring[2])!
        CO2array[days] = Double(linestring[4])!
        NOXarray[days] = Double(linestring[3])!
        SO2array[days] = Double(linestring[5])!
    }
    
    
    return (PWRarray, CO2array, SO2array, NOXarray)
}  // end of loadArrays

// *****************************************************
// Function menu returns an integer corresponding to user selection
// ******************************************************

func menu() -> Int
{
    var userchoice: Int
    print("- ************************** -")
    print("- Operation           Option -")
    print("- Process monthly file   1   -")
    print("- Linear regressions     2   -")
    print("- Standard Deviation     3   -")
    print("- Quit                   0   -")
    print("- ************************** -")
    print("Enter Option: ", terminator: "")
    userchoice = intinput()
    return userchoice
}

// ********************************************************************
func linreg(numdays:Int, pwrarray:[Double], so2array:[Double],co2array:[Double], noxarray:[Double])->(so2_slope:Double, co2_slope:Double,nox_slope:Double, co2_slopealots:Double, so2_slopealots:Double, nox_slopealots:Double)
{
    var pwrsum = 0.0
    var co2sum = 0.0
    var pwrsqr = 0.0
    var pwrco2prod = 0.0
    var co2_slope = 0.0
    var denominator: Double
    var pwravg: Double
    var so2_slope = 0.0
    var nox_slope = 0.0
    var so2sum = 0.0
    var pwrso2prod = 0.0
    var noxsum = 0.0
    var pwrnoxprod = 0.0
    var so2_slopealots = 0.0
    var co2_slopealots = 0.0
    var nox_slopealots = 0.0

    var days: Double
    days = Double (numdays)
    //For loops allow for the sigmas to be calculated
    for cnt in 0...(numdays-1)
    {
        // pwrsum is ∑x and will be used in the denominator
        pwrsum = pwrsum + pwrarray[cnt]
        //individual sigmas
        so2sum = so2sum + so2array[cnt]
        co2sum = co2sum + co2array[cnt]
        noxsum = noxsum + noxarray[cnt]
        //denominator sigmas (∑x^2) & (∑x)^2
        pwrsqr = pwrsqr + pow(pwrarray[cnt],2)
        //total sum ∑x*y
        pwrso2prod = pwrso2prod + (pwrarray[cnt] * so2array[cnt])
        pwrco2prod = pwrco2prod + (pwrarray[cnt] * co2array[cnt])
        pwrnoxprod = pwrnoxprod + (pwrarray[cnt] * noxarray[cnt])
        
    }
    pwravg = pwrsum/days
    //Forms the denominator for the slope equation (n(∑x^2 )-(∑x)^2)
    denominator = pwrsqr * days - pow(pwrsum,2)
    //forms the nominator for each array and then divides it by the denominator (n(∑x•y)-(∑x)(∑y))
    so2_slope = (days * pwrso2prod - pwrsum * so2sum)/denominator
    so2_slope = round(so2_slope * 10000)/10000
    
    co2_slope = (days * pwrco2prod - pwrsum * co2sum)/denominator
    co2_slope = round(co2_slope * 10000)/10000
    
    nox_slope = (days * pwrnoxprod - pwrsum * noxsum)/denominator
    nox_slope = round(nox_slope * 10000)/10000
    
    pwravg = 1007/days
    denominator = pwrsqr * days - pow(1007,2)
    
    so2_slopealots = (days * pwrso2prod - 1007 * so2sum)/denominator
    so2_slopealots = round(so2_slopealots * 100000)/100000
    
    co2_slopealots = (days * pwrco2prod - 1007 * co2sum)/denominator
    co2_slopealots = round(co2_slopealots * 100000)/100000
    
    nox_slopealots = (days * pwrnoxprod - 1007 * noxsum)/denominator
    nox_slopealots = round(nox_slopealots * 100000)/100000
    
    return (so2_slope, co2_slope, nox_slope, so2_slopealots, co2_slopealots, nox_slopealots)
}
// ********************************************************************
func stats(SO2array:[Double], CO2array:[Double], NOXarray:[Double]) -> (finalCO2: Double, finalSO2: Double, finalNOX: Double, SO2average: Double, CO2average: Double, NOXaverage: Double, sum: Double)
{
    
    let denominator: Int
    var sum: Double
    var finalCO2: Double
    var finalSO2: Double
    var finalNOX: Double
    var Co2average: Double
    var So2average: Double
    var Noxaverage: Double
    var newCO2average: Double
    var newSO2average: Double
    var newNOXaverage: Double
    var newnum: Double = 0
    var sum1: [Double]
    var newnum1: [Double] = [0]
    var newnum2: [Double] = [0]
    var newnum3: [Double] = [0]
    
    // mean
    denominator = SO2array.count + CO2array.count + NOXarray.count
    sum1 = SO2array + CO2array + NOXarray
    sum = sum1.reduce(0, combine: +) / Double(denominator)
    
    So2average = SO2array.reduce(0, combine: +) / Double(SO2array.count)
    Co2average = CO2array.reduce(0, combine: +) / Double(CO2array.count)
    Noxaverage = NOXarray.reduce(0, combine: +) / Double(NOXarray.count)
    // end mean
    
    // each number in the array - mean squared
    for i in 0...(CO2array.count - 1){
        
        newnum = pow((CO2array[i] - Co2average), 2)
        newnum1.append(newnum)
      
        newnum = pow((SO2array[i] - So2average), 2)
        newnum2.append(newnum)
        
        newnum = pow((NOXarray[i] - Noxaverage), 2)
        newnum3.append(newnum)
    }
    // end calculations
    
    // new mean
    newCO2average = newnum1.reduce(0, combine: +) / Double(newnum1.count)
    newSO2average = newnum2.reduce(0, combine: +) / Double(newnum2.count)
    newNOXaverage = newnum3.reduce(0, combine: +) / Double(newnum3.count)
    // end new mean
    
    //square root of that number
    
    finalCO2 = sqrt(newCO2average)
    
    finalSO2 = sqrt(newSO2average)
    
    finalNOX = sqrt(newNOXaverage)
    // end square root
    
    return (finalCO2, finalSO2, finalNOX, So2average, Co2average, Noxaverage, sum)
}
// ********************************************************************
var done: Bool

var lines: [String]
var linesnoheader: [String]
var field: [String]
var linenr: Int
var linecounter: Int
var arraycnt: Int
var fieldnr: Int
var sum, average: Double
var nrheaderlines: Int
var nrdays: Int
var select: Int
let home = NSFileManager.defaultManager().currentDirectoryPath


// filemanager = NSFileManager.defaultManager()
//let home = filemanager.currentDirectoryPath

//print(home)

print("Monthly File Processing")

// Prompts:
//  - File name of monthly data file
//  - Number of days of data in file
//  - number of header lines, is normally 1

// Row structure in file:
// - third column of file is AC power, kW
// - fourth column of file is NOX reduction, lbs
// - fifth column of file is CO2 reduction, lbs
// - sixth column of file is SO2 reduction, lbs

// for purposes of demonstration, path prefix is hard wired
print("Enter path of csv file: ")

var path = "/Users/eddieceausu/Desktop/AP CSP/SolarMonthlyData/SolarMonthlyData/hvanov_monthly.csv"
print(path)

print("\n\t Enter number of days in file ",terminator: "")
nrdays = intinput()

// initialize arrays
var PWR_array = [Double] (count: nrdays, repeatedValue: 0.0)
var CO2_array = [Double] (count: nrdays, repeatedValue: 0.0)
var NOX_array = [Double] (count: nrdays, repeatedValue: 0.0)
var SO2_array = [Double] (count: nrdays, repeatedValue: 0.0)
print("\t Enter number of header lines: ", terminator: "")
nrheaderlines = intinput()

// Read the input file into a single HUGE array
// each item in the array is a single line from the input file

lines = readfile(path)

if nrheaderlines == 1 {lines.removeAtIndex(0)}
else
{for i in 0...nrheaderlines - 1  // remove header lines
{lines.removeAtIndex(i)}
}


done = false
while !done
{
    select = menu()
    switch (select)
    {
    case 0: done = true
    case 1:  // process monthly file
        // Tuple avggroup is two arrays.
        let avggroup = loadArrays(lines,nrdays: nrdays)
        PWR_array = avggroup.PWRarray
        CO2_array = avggroup.CO2array
        SO2_array = avggroup.SO2array
        NOX_array = avggroup.NOXarray
    print("Processing File...")
        delay(50, closure: {
            print(" ")
        })
        break
    case 2: // linear regressions
        print("Calculating Linear Regressions...")
        print(" ")
        let coeffgroup = linreg(nrdays, pwrarray:PWR_array, so2array:SO2_array, co2array:CO2_array, noxarray:NOX_array)

        print("CO2 coefficient is \(coeffgroup.co2_slope)")
        print("NOX coefficient is \(coeffgroup.nox_slope)")
        print("SO2 coefficient is \(coeffgroup.so2_slope)")
        print(" ")
//Print the school, estimated number of panels, estimated power output, and then greenhouse reductions for that school.
        print("Al Lots has about 1007 panels, producing 302.1kW per hour")
        print("NOX coefficient is \(coeffgroup.nox_slopealots)")
        print("CO2 coefficient is \(coeffgroup.co2_slopealots)")
        print("SO2 coefficient is \(coeffgroup.so2_slopealots)")
        break
    case 3: //Standard Deviation
        print("Calculating the standard deviation")
        let average = stats(SO2_array, CO2array: CO2_array, NOXarray: NOX_array)
/*
        print("Computer")
        print("The Standard Deviation of SO2 is: \(round(standardDeviation(SO2_array) * 1000) / 1000)")
        print("The Standard Deviation of NOX is: \(round(standardDeviation(NOX_array) * 1000) / 1000)")
        print("The Standard Deviation of CO2 is: \(round(standardDeviation(CO2_array) * 1000) / 1000)") 
 */
        print("The Standard Deviation of SO2 \(round(average.finalSO2 * 1000) / 1000)")
        print("The Standard Deviation of CO2 is: \(round(average.finalCO2 * 1000) / 1000)")
        print("The Standard Deviation of NOX is: \(round(average.finalNOX * 1000) / 1000)")
        break
    default: print("You must select valid choice")
    }  // end of switch
    
}  // end of while



