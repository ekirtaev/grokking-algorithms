//
//  ChapterNineClass.swift
//  grokking-algorithmsTests
//
//  Created by Евгений Киртаев on 27.01.2022.
//  Copyright © 2022 Евгений Киртаев. All rights reserved.
//

import XCTest

class ChapterNineClass: XCTestCase {

  func test() {
    //given
    let chapter = ChapterNineClass()
    let inputValues:[String: Int] = ["guitar" : 1500,
                                     "speker" : 3000,
                                     "notebook" : 2000,
                                     "iphone" : 2000,
                                     "mp3" : 1000]
    let inputWeights:[String: Int] = ["guitar" : 1,
                                     "speker" : 4,
                                     "notebook" : 3,
                                      "iphone" : 1,
                                      "mp3" : 1]
]
    let inputWeightConstraint = 4
    let expectedResult: Set = ["mp3", "iphone", "guitar"]
    
    //when
    let result = chapter.maxValue(from: inputValues, weights: inputWeights, weightConstraint: inputWeightConstraint)
    
    //then
    XCTAssertEqual(expectedResult, result)
  }

}
