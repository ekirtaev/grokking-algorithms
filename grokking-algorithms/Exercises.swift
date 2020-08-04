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
    
    //quicksort
    
    @objc public func quickSortNumerics(numerics: [Int]) -> [Int] {
        
        if numerics.count < 2 {
            return numerics
        } else {
            let anchorIndex: Int = Int(numerics.count/2)
            let anchor: Int = numerics[anchorIndex]
            return quickSortNumerics(numerics: Array(numerics[0...(anchorIndex - 1)])) + [anchor] + quickSortNumerics(numerics: Array(numerics[(anchorIndex + 1)...numerics.count - 1]))
        }
    }
    
    static func printTimeElapsedWhenRunningCode(title:String, operation:()->()) {
        let startTime = CFAbsoluteTimeGetCurrent()
        operation()
        let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
        print("Time elapsed for \(title): \(timeElapsed) s.")
    }
}

//Chapter 7

public class ChapterSevenClass: NSObject {
    
    @objc public func dijkstraAlgorithm() -> Void {
        
        var processed: [String] = [String]()
        let graph: [String : [String : Int]] = ["start" : [ "a" : 6,
                                                            "b" : 2],
                                                "a" : ["fin" : 1],
                                                "b" : ["a" : 3,
                                                       "fin": 5]]
        var costs: [String : Int] = ["a" : 6, "b" : 2, "fin" : Int.max]
        var parents: [String : String?] = ["a" : "start", "b" : "start", "fin" : nil]
        var lowestCostNode: String? = self.findLowestCostNodeInCosts(costs: costs, withProcessedNodes: processed)
        
        while lowestCostNode != nil {
            let parentCost: Int = costs[lowestCostNode!]!
            if let neighbors: [String : Int] = graph[lowestCostNode!]  {
                for (neighbor, cost) in neighbors {
                    let newCost: Int = parentCost + cost
                    if newCost < costs[neighbor]! {
                        costs[neighbor] = newCost
                        parents[neighbor] = lowestCostNode
                    }
                }
            }
            processed.append(lowestCostNode!)
            lowestCostNode = self.findLowestCostNodeInCosts(costs: costs, withProcessedNodes: processed)
        }
        
        let finCost: Int = costs["fin"]!
        var tmpParent: String = "fin"
        var parentsSequence: [String] = [tmpParent]
        while tmpParent != "start" {
            tmpParent = parents[tmpParent]!!
            parentsSequence.append(tmpParent)
        }
        parentsSequence.reverse()
        
        NSLog("FIN Cost is %d, Sequence is %@", finCost, parentsSequence)
    }
    
    @objc public func dijkstraAlgorithmForGraph(graph: [String : [String : Int]], cost : UnsafeMutablePointer<Int>) -> [String] {
        
        var processed: [String] = [String]()
        
        var costs: [String : Int] = ["fin" : Int.max]
        var parents: [String : String?] = ["fin" : nil]
        let startNeighbours: [String : Int] = graph["start"]!
        for (neighbour, cost) in startNeighbours {
            parents[neighbour] = "start"
            costs[neighbour] = cost
        }
        
        var lowestCostNode: String? = self.findLowestCostNodeInCosts(costs: costs, withProcessedNodes: processed)
        
        while lowestCostNode != nil {
            let parentCost: Int = costs[lowestCostNode!]!
            if let neighbours: [String : Int] = graph[lowestCostNode!]  {
                for (neighbour, cost) in neighbours {
                    let newCost: Int = parentCost + cost
                    if !costs.keys.contains(neighbour) {
                        costs[neighbour] = newCost
                        parents[neighbour] = lowestCostNode
                    }
                    let currentCost: Int = costs[neighbour]!;
                    if newCost < currentCost {
                        costs[neighbour] = newCost
                        parents[neighbour] = lowestCostNode
                    }
                }
            }
            processed.append(lowestCostNode!)
            lowestCostNode = self.findLowestCostNodeInCosts(costs: costs, withProcessedNodes: processed)
        }
        
        let finCost: Int = costs["fin"]!
        var tmpParent: String = "fin"
        var parentsSequence: [String] = [tmpParent]
        while tmpParent != "start" {
            tmpParent = parents[tmpParent]!!
            parentsSequence.append(tmpParent)
        }
        parentsSequence .reverse()
                
        cost.pointee = finCost
        return parentsSequence
    }
    
    func findLowestCostNodeInCosts(costs: [String : Int], withProcessedNodes processed: [String]) -> String? {
        var lowestCost: Int = Int.max;
        var lowestCostNode: String? = nil
        for (node, cost) in costs {
            if cost < lowestCost && !processed.contains(node as String) {
                lowestCostNode = node as String
                lowestCost = cost
            }
        }
        return lowestCostNode
    }
}
