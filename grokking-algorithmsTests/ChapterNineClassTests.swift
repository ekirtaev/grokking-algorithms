//
//  ChapterNineClass.swift
//  grokking-algorithmsTests
//
//  Created by Евгений Киртаев on 27.01.2022.
//  Copyright © 2022 Евгений Киртаев. All rights reserved.
//

import XCTest

class ChapterNineClassTests: XCTestCase {

  func testDynamicProgramming() {
    //given
    let chapter = ChapterNineClass()
    let inputValues:[String: Int] = ["guitar" : 1500,
                                     "speaker" : 3000,
                                     "notebook" : 2000,
                                     "iphone" : 2000,
                                     "mp3" : 1000]
    let inputWeights:[String: Int] = ["guitar" : 1,
                                     "speaker" : 4,
                                     "notebook" : 3,
                                     "iphone" : 1,
                                     "mp3" : 1]
    let inputWeightConstraint = 4
    let expectedResult: Set = ["mp3", "iphone", "guitar"]
    
    //when
    let result = chapter.maxValue(from: inputValues, weights: inputWeights, weightConstraint: inputWeightConstraint)
    
    //then
    XCTAssertEqual(expectedResult, result)
  }
  
  //9.1
  func testDynamicProgramming91() {
    //given
    let chapter = ChapterNineClass()
    let inputValues:[String: Int] = ["water" : 10,
                                     "book" : 3,
                                     "food" : 9,
                                     "coat" : 5,
                                     "camera" : 6]
    let inputWeights:[String: Int] = ["water" : 3,
                                     "book" : 1,
                                     "food" : 2,
                                     "coat" : 2,
                                     "camera" : 1]
    let inputWeightConstraint = 6
    let expectedResult: Set = ["food", "water", "camera"]
    
    //when
    let result = chapter.maxValue(from: inputValues, weights: inputWeights, weightConstraint: inputWeightConstraint)
    
    //then
    XCTAssertEqual(expectedResult, result)
  }

}
