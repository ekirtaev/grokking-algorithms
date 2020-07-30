//
//  Exercises.swift
//  grokking-algorithms
//
//  Created by Евгений Киртаев on 29.07.2020.
//  Copyright © 2020 Евгений Киртаев. All rights reserved.
//

import CoreGraphics
import Foundation

//Chapter 4

public class ChapterFourClass : NSObject {
    
     @objc public func minSquareSizeInCanvas(canvas: CGSize) -> CGSize {
        
        let minSide = min(canvas.height, canvas.width)
        let maxSide = max(canvas.height, canvas.width);
        
        if maxSide.remainder(dividingBy: minSide) == 0 {
            return CGSize(width: minSide, height: minSide);
        } else {
            let round = Int(maxSide/minSide);
            let diff = maxSide - CGFloat(round) * minSide;
            return minSquareSizeInCanvas(canvas: CGSize(width: minSide, height: diff))
        }
    }
    
    //4.1
    @objc public func sum(numerics: Array<Int>) -> Int {
        if numerics.count == 0 {
            return 0
        } else {
            let first: Int = numerics.first!
            var mNumerics: Array = numerics
            mNumerics.removeFirst()
            return first + sum(numerics: mNumerics)
        }
    }
    
    //4.2
    
    @objc public func count(array: Array<Any>) -> Int {
        if array.isEmpty {
            return 0
        } else {
            var mArray: Array = array
            mArray.removeFirst()
            return 1 + count(array: mArray);
        }
    }
    
    //4.3
    
    @objc public func maxNumericIn(numerics: [Int]) -> Int {
        if numerics.count == 1 {
            return numerics.first!;
        } else {
            let first: Int = numerics.first!
            var mArray: Array = numerics
            mArray.removeFirst()
            let maxInRemainder: Int = maxNumericIn(numerics: mArray)
            if first > maxInRemainder {
                return first
            } else {
                return maxInRemainder;
            }
        }
    }
    
    //4.4
    
    @objc public func binarySearchIndexForNumeric(numeric: Int, inArray numerics:Array<Int>) -> Int {
        if numerics.count == 1 {
            if numerics.first == numeric {
                return 0
            } else {
                return NSNotFound;
            }
        } else {
            let middleIndex = Int(numerics.count/2)
            let middleValue = numerics[middleIndex]
            var firstIndex: Int = 0
            var lastIndex: Int = numerics.count > 0 ? numerics.count - 1 : 0;
            if numeric < middleValue {
                lastIndex = middleIndex - 1;
            } else {
                firstIndex = middleIndex
            }
            return firstIndex + binarySearchIndexForNumeric(numeric: numeric, inArray: Array(numerics[firstIndex...lastIndex]))
        }
    }
}
