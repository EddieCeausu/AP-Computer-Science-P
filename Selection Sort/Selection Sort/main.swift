//
//  main.swift
//  Selection Sort
//
//  Created by Eddie Ceausu on 11/30/16.
//  Copyright © 2016 Eddie Ceausu. All rights reserved.
//
import Foundation
import Swift
import Darwin
import Quartz

var arraysize: Int
var upperlimit: UInt32
var i, r, j: Int
var max: Int
var intlist = [Int] ()
var passes: Int
arraysize = 0
upperlimit = 0
var totaltime: Double
var done: Bool
done = false

func insertionSort(a: [Int]) -> [Int] {
    var a = intlist
    for x in 1..<a.count {
        var y = x
        while (y > 0 && a[y] < a[y - 1]) {
            a.swapAt(y - 1, y)
            y -= 1
        }
    }
    return a
}

while !done {
    var select: Int
    func menu() ->Int
    {
        print("")
        print("Selection Sort Program")
        print("**************************")
        print("Load                   1 *")
        print("Sort array             2 *")
        print("Insertion sort         3 *")
        print("Print array            4 *")
        print("Binary search          5 *")
        print("Sequential Search      6 *")
        print("Clear Array            7 *")
        print("Quit                   0 *")
        print("**************************")
        print("Enter option: ")
        return Int(readLine()!)!
    }
    
    select = menu()
    switch(select) {
    case 0:
        exit(0)
        break
    case 1:
        //  Loading and Sorting array
        print("Enter array size: ");
        arraysize = Int(readLine()!)!
        print("Enter Upper Limit: ")
        upperlimit = UInt32(readLine()!)!
        
        let starttime = CACurrentMediaTime()
        
        print("Loading array with random numbers...");
        
        for _ in 0 ..< arraysize {
            
            r = Int (arc4random_uniform(upperlimit))
            intlist.append(r)
        }
        let endtime = CACurrentMediaTime()
        
        print("Load array time is ", endtime-starttime, " sec")
        
        break
    case 2: // Sorting array
        let starttime = CACurrentMediaTime()
        max = intlist[0]
        
        print("\n Sorting Array...")
        
        for i in 0...(arraysize - 1)
        {
            for j in i...(arraysize - 1)
            {
                if (intlist[j] < intlist[i])
                {
                    intlist.swapAt(i, j)
                }
            }
        }
        
        let endtime = CACurrentMediaTime
        
        print("Sort Array time is \(endtime() - starttime) sec")
        break
    case 3:  // insertion sort
        
        // Variables
        var r: Int
        var starttime: Double
        var endtime: Double
        var index: Int
       // var j: Int = 0
        var intlist = [Int]()
       // var Yes, Y, y, yes, no, n, No, N: String
        
        //remove all
        intlist.removeAll()
        
        //remove all insurance
        intlist.removeAll()
        
        //initialization
        print("Insertion Sort")
        print("Enter array size: ")
        arraysize = Int(readLine()!)!
        print("\n Sorting Array...")
        
        //Insertion Sort
        starttime = CACurrentMediaTime()
        for j in 0...(arraysize-1)
        {
            r = Int (arc4random_uniform(50000))
            index = j
            while(index > 0 && r < intlist[index-1]) {
                index = index-1
            }
            intlist.insert(r, at: index)
        }
        endtime = CACurrentMediaTime()
        
        //Print Statements
        print("Array Sorted! Would you like to Print the sorted array?")
        let response = String(readLine()!)
        if (response == ("Yes")) {
            print(intlist)
        }
        var totaltime = endtime - starttime
        totaltime = round(1000*totaltime)/1000
        print("Building and Sorting took: \(totaltime) seconds")
        break
        
    case 4:
        //print Array
        print(intlist)
        
        break
    case 5:
        // Variables
        var lower, middle, upper: Int
        var target: Int
        var found: Bool = false
        var passes: Int
        var starttime: Double
        var endtime: Double
        // Values
        
        lower = 0
        upper = intlist.count
        middle = intlist.count / 2
        passes = 0
        starttime = 0
        endtime = 0
        
        // Initialization
        
        print("Binary Search")
        print ("What number would you like to find")
        target = Int(readLine()!)!
        print("Searching array of size \(intlist.count) for value \(target)...\n")
        
        // Binary Search
        starttime = CACurrentMediaTime()
        print(intlist[middle])
        while (intlist[middle] != target) && (lower <= upper) {
            passes += 1
            if target < intlist[middle] {
                upper = middle - 1
            }
            else {
                lower = middle + 1
            }
            // if target > intlist.count { print("Value cannot be larger than arraysize") }
            middle = (upper + lower) / 2
            
        }
        if target > intlist[middle] { print("Value cannot be larger than arraysize") }
        else {
            found = (intlist[middle] == target)}
        endtime = CACurrentMediaTime()
        
        // Passes and if target print statements
        totaltime = endtime - starttime
        totaltime = round(totaltime*1000)/1000
        print("Search time is ", totaltime, " sec")
        if found {
            print("\(target) was found, required \(passes) passes")
        }
        else {
            print("\(target) was not found, required \(passes) passes")
        }
        
        break
        
    case 6:
        //sequential search
        var run = false
        var rdnumber: Int
        passes = 0
        var i = 0
        var starttime: Double = 0
        var endtime: Double = 0
        print("Please enter a number from 0 to \(upperlimit):", terminator: "")
        rdnumber = Int(readLine()!)!
        
        while !run {
            starttime = CACurrentMediaTime()
            for r in 0 ..< intlist.count {
                passes += 1
                if(rdnumber == intlist[r])
                {
                    i = r
                    run = true
                }
                endtime = CACurrentMediaTime()
            }
            
            if !run {
                print("Number not found")
                run = true
            }
            totaltime = endtime - starttime
            totaltime = round(totaltime*1000)/1000
            print("Search took:", totaltime, "")
            print("Number of passes: \(passes)");
            if run == true {
                print("\(rdnumber) found at: \(i)") }
            
        }
    case 7:
        //clear array
        print("Clearing arary...")
        intlist.removeAll()
        print("Array Cleared")
        break
    default:
        if ((select < 0) || (select > 7)) {
            print("Must enter an integer between 0 and 6")
        }
        
    }
}
// end of while
//***************************************************************************************************
