//
//  ChapterSevenClass.swift
//  grokking-algorithmsTests
//
//  Created by Евгений Киртаев on 25.01.2022.
//  Copyright © 2022 Евгений Киртаев. All rights reserved.
//

import XCTest

class ChapterSevenTests: XCTestCase {

  func testDijkstrasAlgorithm() {
    //given
    let chapter = ChapterSevenClass()
    let cost = 6
    let input: [String: [String: Double]] = ["start" : [
      "a" : 6,
      "b" : 2],
                 "a" : ["fin" : 1],
                 "b" : [
                  "a" : 3,
                  "fin" : 5]
    ]
    let expectedResult = (["start", "b", "a", "fin"], Double(cost))
    
    //when
    let result = chapter.dijkstrasAlgorithmForGraph(graph: input)
    
    //then
    let eql = expectedResult == result!
    XCTAssertTrue(eql)

  }
  
  //7.1
  func testDijkstrasAlgorithm71() {
    //given
    let chapter = ChapterSevenClass()
    let cost = 8
    let input: [String: [String: Double]] = ["start" : [
      "a" : 5,
      "b" : 2],
                 "a" : [
                  "d" : 2,
                  "c" : 4],
                 "b" : [
                  "a" : 8,
                  "d" : 7],
                 "c" : [
                  "d" : 6,
                  "fin": 3],
                 "d" : ["fin" : 1]
    ]
    
    let expectedResult = (["start", "a", "d", "fin"], Double(cost))
    
    //when
    let result = chapter.dijkstrasAlgorithmForGraph(graph: input)
    
    //then
    let eql = expectedResult == result!
    XCTAssertTrue(eql)
    
  }
  
  //7.2
  func testDijkstrasAlgorithm72() {
    //given
    let chapter = ChapterSevenClass()
    let cost = 60
    let input: [String: [String: Double]] = ["start" : ["a" : 10],
                 "a" : ["c" : 20],
                 "b" : ["a" : 1],
                 "c" : [
                  "b" : 1,
                  "fin" : 30]
    ]
    let expectedResult = (["start", "a", "c", "fin"], Double(cost))
    
    //when
    let result = chapter.dijkstrasAlgorithmForGraph(graph: input);
    
    //then
    let eql = expectedResult == result!
    XCTAssertTrue(eql)
    
  }
  
  //7.3
  func testDijkstrasAlgorithm73() {
    //given
    let chapter = ChapterSevenClass()
    let cost = 4
    let input: [String: [String: Double]] = ["start" : [
      "a" : 2,
      "b" : 2],
                 "a" : ["b" : 2],
                 "b" : [
                  "c" : 2,
                  "fin" : 2],
                 "c" : [
                  "a" : -1,
                  "fin": 2],
    ]
    let expectedResult = (["start", "b", "fin"], Double(cost))
    
    //when
    let result = chapter.dijkstrasAlgorithmForGraph(graph: input);
    
    //then
    let eql = expectedResult == result!
    XCTAssertTrue(eql)
    
  }
}
