//
//  ChapterSixTests.swift
//  grokking-algorithmsTests
//
//  Created by Евгений Киртаев on 26.01.2022.
//  Copyright © 2022 Евгений Киртаев. All rights reserved.
//

import XCTest

class ChapterSixTests: XCTestCase {

  //6.1
  func testBreadthFirstSearchInGraph61() {
    //given
    let chapter = ChapterSixClass()
    let input: [String: [String]] = ["start": ["a", "c"],
                                     "a": ["b", "finish"],
                                     "c": ["b", "d"],
                                     "d": ["finish"]]
    let expectedResult = ["start", "a", "finish"]
    
    //when
    let result = chapter.breadthFirstSearchInGraph(graph: input, startNode: "start", finishNode: "finish")
    
    //then
    XCTAssertEqual(expectedResult, result)
  }
  
  //6.2
  func testBreadthFirstSearchInGraph62() {
    //given
    let chapter = ChapterSixClass()
    let input: [String: [String]] = ["cab": ["cat", "car"],
                                     "cat": ["mat", "bat"],
                                     "car": ["cat", "bar"],
                                     "mat": ["bat"],
                                     "bar": ["mat"]]
    let expectedResult = ["cab", "cat", "bat"]
    
    //when
    let result = chapter.breadthFirstSearchInGraph(graph: input, startNode: "cab", finishNode: "bat")

    //then
    XCTAssertEqual(expectedResult, result)
  }

}
