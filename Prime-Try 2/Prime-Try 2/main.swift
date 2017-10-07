//
//  main.swift
//  Prime-Try 2
//
//  Created by Eddie Ceausu on 8/19/17.
//  Copyright © 2017 Eddie Ceausu. All rights reserved.
//

import Foundation

func getPrimes(to n: Int) -> [Int] {
    let xmody = (1...n)
        .map { x in (1...n).map { y in x % y } }
    
    let primes = xmody
        .map { mods in
            mods.enumerated()
                .filter { y, mod in mod == 0 }
                .map { y, mod in y + 1 } // divisors for x
        }
        .enumerated()
        .filter { x, zs in
            guard let z0 = zs.first, let z1 = zs.last, zs.count <= 2 else {
                return false
            }
            return z0 == 1 && z1 == x + 1
        }
        .map { x, _ in x + 1 }
    
    return primes
}
var n = 123456
print(getPrimes(to: n))


