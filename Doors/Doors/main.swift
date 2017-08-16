import Foundation
import Darwin
import Quartz

var doors = [Int]()
/* enum DoorState:String {
    case Opened = "1"
    case Closed = "0"
}declare list of doors state and initialize them


func printd(_ doors: [Int]) {
  print("Would you like to Print the doors?")
  let response = String(readLine()!)
  if response == "Y" {
    print(doors)
    return
  }
}
func create(_ doors: [Int]) -> [Int] {
  var doors = doors
  for _ in 0...100 - 1 {
    doors.append(0)
  }
  print("\(doors) count is: \(doors.count)")
  print("1 is open and 0 is closed")
  return doors
}

func initopen(_ doors: [Int]) -> [Int] {
  var doors = doors
  for i in 0...doors.count-1 {
    if doors[i] == 0 {
      doors[i] = 1
    }
  }
  return doors
}

func open(_ doors: [Int]) -> [Int] {
    var doors = doors
    var max = 0
    let i = 2
    let x = 0
    var doorsopen = [Int]()
    while i <= doors.count {
        max = 100 / i
        for x in 0...max {
            doorsopen.append(x * i)
            print(doorsopen)
        }
        for a in doorsopen {
            print(doors[a])
            print(doorsopen[a])
        }
    }
    return doors
}
*/
func open2() {
    var state: String
    for i in 1...100 {
        if pow(Double(i), 0.5).truncatingRemainder(dividingBy: 1) == 0 {
            state = "open"
        }
        else {
            state = "close"
        }
        print("Door \(i):\(state)")
    }
}; open2()

var done = false
while !done {
    func fib(_ n:Int) -> Int {
        if n <= 1 {
            return n
        }
        else {
            return(fib(n-1) + fib(n-2))
        }
    }
   
    print("Fibonacci sequence of values under 4,000,000")
    var i = 0
    var fibo = [Int]()
    
    while fib(i) < 4_000_000 {
        if fib(i) % 2 == 0 {
            fibo.append(fib(i))
            print(fib(i))
        }
        i += 1
    }
    i = fibo.reduce(0, +)
    print("The sum of the Even numbers of the fibonacci sequence values under 4,000,000: \(i)")
    done = true
}

func primefinder() {
    let done = false
    var number: Double = 1
    var primes = [Double]()
    var j = 1_000_000.0
    var a = 100_000.0
    var ex: Int = 15015
    var file, contents: String
    var path: URL
    while !done {
        var prime: Bool = true
        var i = 3
        number += 2
        let start = CACurrentMediaTime()
        while(Double(i * i) <= number) {
            if number.truncatingRemainder(dividingBy: Double(i)) == 0 {
                prime = false
                break
            }
            i += 2
        }
        
        if prime != false {
            primes.append(number)
        }
        
        if primes.count == Int(a) {
            print("\(a) prime numbers found")
            a += 100_000.0
        }
        
        if primes.count == Int(j) {
            let end = CACurrentMediaTime()
            print((end-start),"To calculate \(j) primes")
            print("\n Example of prime # \(ex): \(primes[ex])")
            j += j
                // file creation of array is too large to print
                file = "\(Int(j)) primes.txt"
                contents = String(describing: primes).replacingOccurrences(of: "]", with: "").replacingOccurrences(of: "[", with: "").replacingOccurrences(of: ".0", with: "")
            
                if let directory = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true).first {
                    path = URL(fileURLWithPath: directory).appendingPathComponent(file)
                    print("Due to your file being larger than \(1_000_000) items, it was placed at: \(path)")
                    //writing
                    do {
                        try contents.write(to: path, atomically: false, encoding: String.Encoding.utf8)
                    }
                    catch {print("Unable to write to: \(path)")}
                }
            }
        }
    }; primefinder()


/*
 
 def recur_fibo(n):
 """Recursive function to
 print Fibonacci sequence"""
 if n <= 1:
 return n
 else:
 return(recur_fibo(n-1) + recur_fibo(n-2))
 
 # Change this value for a different result
 nterms = 4000000
 
 # uncomment to take input from the user
 #nterms = int(input("How many terms? "))
 fib = []
 # check if the number of terms is valid
 if nterms <= 0:
 print("Plese enter a positive integer")
 else:
 print("Fibonacci sequence:")
 i = 0
 x = 0
 while x < 514229:
 i += 1
 print(recur_fibo(i))
 if recur_fibo(i) % 2 == 0:
 x = recur_fibo(i)
 fib.append(x)
 sum(fib)

 
doors = create(doors)
doors = initopen(doors)
printd(doors)
open(doors)
*/

/* declare enum to identify the state of a door
enum DoorState:String {
    case Opened = "Opened"
    case Closed = "Closed"
}

/* declare list of doors state and initialize them */
var doorsStateList = [DoorState](repeating: DoorState.Closed, count: 100)

/* set i^2 doors to opened */
var i = 1
repeat {
    
    doorsStateList[(i*i)-1] = DoorState.Opened
    i += 1
} while (i*i) <= doorsStateList.count

/* print the results
for (index, item) in doorsStateList.enumerated() {
    print("Door \(index+1) is \(item.rawValue)")
} */*/
