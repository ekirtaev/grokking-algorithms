//
//  ChapterSevenClass.swift
//  grokking-algorithmsTests
//
//  Created by Евгений Киртаев on 25.01.2022.
//  Copyright © 2022 Евгений Киртаев. All rights reserved.
//

import XCTest

class ChapterSevenClass: XCTestCase {

  func testDijkstrasAlgorithm() {
    //given
    let chapter = ChapterSevenClass()
    var cost = 0
    let input = ["start" : [
      "a" : 6,
      "b" : 2],
                 "a" : ["fin" : 1],
                 "b" : [
                  "a" : 3,
                  "fin" : 5]
    };
    let expectedResult = ["start", "b", "a", "fin"]
    
    //when
    let result = chapter.dijkstraAlgorithmForGraph(graph: input, cost: cost);
    
    //then
    XCTAssertEqual(expectedResult, result)
  }
  
  //7.1
  
  //7.2
  
  //7.3

}
