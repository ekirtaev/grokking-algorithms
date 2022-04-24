//
//  Exercises.swift
//  grokking-algorithms
//
//  Created by Евгений Киртаев on 29.07.2020.
//  Copyright © 2020 Евгений Киртаев. All rights reserved.
//

import CoreGraphics
import Foundation

//Chapter 1

public class ChapterOneClass : NSObject {
  
  @objc public func binarySearch(sortedList: [Int], item: Int) -> NSNumber? {
    
    var low: Int = 0
    var high: Int = sortedList.count - 1
    
    while low <= high {
      let mid: Int = (high - low)/2;
      let guess: Int = sortedList[mid]
      if guess == item {
        return NSNumber(value: mid)
      } else if item < guess {
        high = mid
      } else if item > guess {
        low = mid
      }
    }
    return nil
  }
  
}

//Chapter 4

public class ChapterFourClass : NSObject {
  
  @objc public func euclidianAlgorithm(first: Int, second: Int) -> Int {
    
    let min = min(first, second)
    let max = max(first, second);
    
    if max % min == 0 {
      return min;
    } else {
      let round = Int(max/min);
      let diff = max - round * min;
      return euclidianAlgorithm(first: min, second: diff)
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
  
  @objc public func binarySearchRecursiveForNumeric(numeric: Int, inArray numerics:Array<Int>) -> Int {
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
      return firstIndex + binarySearchRecursiveForNumeric(numeric: numeric, inArray: Array(numerics[firstIndex...lastIndex]))
    }
  }
  
  //quicksort
  
  @objc public func quickSortNumerics(numerics: [Int]) -> [Int] {
    
    if numerics.count < 2 {
      return numerics
    } else {
      let anchorIndex: Int = Int(numerics.count/2)
      let anchor: Int = numerics[anchorIndex]
      var less = [Int]()
      var greater = [Int]()
      for (index, value) in numerics.enumerated() {
        if index != anchorIndex {
          if value <= anchor {
            less.append(value)
          } else {
            greater.append(value)
          }
        }
      }
      return quickSortNumerics(numerics: less) + [anchor] + quickSortNumerics(numerics: greater)
    }
  }
  
  static func printTimeElapsedWhenRunningCode(title:String, operation:()->()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    operation()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    print("Time elapsed for \(title): \(timeElapsed) s.")
  }
}

//Chapter 6

public class ChapterSixClass: NSObject {
  
  struct Queue<T> {
    
    var container: [T] = [T]()
    var count: UInt64 {
      get {
        return UInt64(self.container.count)
      }
    }
    
    mutating func push(_ element: T) {
      self.container.append(element)
    }
    
    mutating func pop() -> T {
      return self.container.removeFirst()
    }
    
    mutating func clear() {
      self.container = []
    }
    
  }
  
  func breadthFirstSearchInGraph(graph: [String: [String]], startNode: String, finishNode: String) -> [String]? {
    
    var queue: Queue = Queue<String>()
    queue.push(startNode)
    var parents = [String: String]()
    var lastNode: String = ""
    var alreadyInQueue = Set<String>()
    
    while queue.count > 0 {
      let node = queue.pop()
      if node == finishNode {
        lastNode = finishNode
        queue.clear()
      } else {
        if let neighbors = graph[node] {
          for neighbor in neighbors {
            if !alreadyInQueue.contains(neighbor) {
              parents[neighbor] = node
              queue.push(neighbor)
              alreadyInQueue.insert(neighbor)
            }
          }
        }
      }
    }
    
    if lastNode == finishNode {
      var sequence = [String]()
      sequence.append(lastNode)
      while sequence.last != startNode {
        lastNode = parents[lastNode]!
        sequence.append(lastNode)
      }
      return sequence.reversed()
    } else {
      return nil
    }
  }
}

//Chapter 7

public class ChapterSevenClass: NSObject {
  
  func dijkstrasAlgorithmForGraph(graph: Dictionary<String, [String: Double]>) -> ([String], Double)? {
    
    var processed: [String] = [String]()
    var parents: [String: String] = [String: String]()
    var costs: [String: Double] = [String: Double]()
    
    costs["fin"] = Double.infinity
    let startNeighbours = graph["start"]
    for (node, cost) in startNeighbours! {
      parents[node] = "start"
      costs[node] = cost;
    }
    
    while let lowestCostNode = self.findLowestCostNode(costs: costs, processed: processed) {
      if let neighbours = graph[lowestCostNode] {
        for (node, cost) in neighbours {
          let newCost = costs[lowestCostNode]! + cost
          if let oldCost = costs[node] {
            if newCost < oldCost {
              parents[node] = lowestCostNode
              costs[node] = newCost;
            }
          } else {
            parents[node] = lowestCostNode
            costs[node] = newCost;
          }
        }
      }
      processed.append(lowestCostNode)
    }
    
    let finCost: Double = costs["fin"]!
    var tmpParent: String = "fin"
    var parentsSequence: [String] = [tmpParent]
    while tmpParent != "start" {
      tmpParent = parents[tmpParent]!
      parentsSequence.append(tmpParent)
    }
    parentsSequence.reverse()
    
    return (parentsSequence, finCost)
  }
  
  func findLowestCostNode(costs:[String: Double], processed:[String]) -> String? {
    
    var lowestCost = Double.infinity
    var lowestCostNode: String? = nil
    for (node, cost) in costs {
      if !processed.contains(node) && cost < lowestCost {
        lowestCostNode = node
        lowestCost = cost
      }
    }
    return lowestCostNode;
  }
}

//Chapter 8
//Chapter 9

class ChapterNineClass: NSObject {
  
  func maxValue(from values:[String: Int], weights:[String: Int], weightConstraint:Int) -> Set<String>? {
    
    var matrix = [[[String]]]()
    let items:[String] = [String](values.keys);
    
    for (index, item) in items.enumerated() {
      var row:[[String]] = [[String]]()
      let itemWeight = weights[item]!
      let itemValue = values[item]!
      for j in 0..<weightConstraint {
        let currentWeight = j + 1
        var cellValues:[String] = [String]()
        let itemValue = (itemWeight <= currentWeight) ? itemValue : 0
        if index - 1 >= 0 {
          let previuosItems = matrix[index-1][j]
          var previousValue = 0
          for item in previuosItems {
            previousValue += values[item]!
          }
          
          var currentValue = itemValue
          let weightReminder = currentWeight - itemWeight
          var itemsForWeightReminder:[String] = [String]()
          if weightReminder > 0 {
            itemsForWeightReminder = matrix[index - 1][weightReminder - 1]
            for item in itemsForWeightReminder {
              currentValue += values[item]!
            }
          }
          
          if previousValue > currentValue {
            cellValues = previuosItems
          } else if currentValue > 0{
            cellValues = [item] + itemsForWeightReminder
          }
          
        } else {
          cellValues = itemValue > 0 ? [item] : []
        }
        row.append(cellValues)
      }
      matrix.append(row)
    }
    
    let result = matrix[items.count - 1][weightConstraint - 1]
    return Set(result)
  }
}

