//
//  ChapterFourTests.swift
//  grokking-algorithmsTests
//
//  Created by Евгений Киртаев on 20.01.2022.
//  Copyright © 2022 Евгений Киртаев. All rights reserved.
//

import XCTest

class ChapterFourTests: XCTestCase {

    func testMinSizeSquareInCanvasWithSize() {
      //given
      let chapter = ChapterFourClass()
      let inputFirst = 1680
      let inputSecond = 640
      let expectedResult = 80
      
      //when
      let result = chapter.euclidianAlgorithm(first: inputFirst, second: inputSecond)
      
      //then
      XCTAssertEqual(expectedResult, result)
    }
  
  func testSum() {
    //given
    let chapter = ChapterFourClass()
    let input = [2, 4, 6]
    let expectedResult = 12
    
    //when
    let result = chapter.sum(numerics: input)
    
    //then
    XCTAssertEqual(expectedResult, result)
  }
  
  func testCount() {
    //given
    let chapter = ChapterFourClass()
    let input = [2, 4, 6]
    let expectedResult = 3
    
    //when
    let result = chapter.count(array: input)
    
    //then
    XCTAssertEqual(expectedResult, result)
  }
  
  func testMaxNumeric() {
    //given
    let chapter = ChapterFourClass()
    let input = [2, 4, 6]
    let expectedResult = 6
    
    //when
    let result = chapter.maxNumericIn(numerics: input)
    
    //then
    XCTAssertEqual(expectedResult, result)
  }
  
  func testBinarySearchRecursive() {
    //given
    let chapter = ChapterFourClass()
    let input =  [2, 4, 6, 11, 100, 239, 1000]
    let expectedResult = 2
    
    //when
    let result = chapter.binarySearchRecursiveForNumeric(numeric: 6, inArray: input)
    
    //then
    XCTAssertEqual(expectedResult, result)
  }
  
  func testQuickSort() {
    //given
    let chapter = ChapterFourClass()
    let input =  [2, 4, 1000, 6, 11, 100, 239, 5]
    let expectedResult = [2, 4, 5, 6, 11, 100, 239, 1000]
    
    //when
    let result = chapter.quickSortNumerics(numerics: input)
    
    //then
    XCTAssertEqual(expectedResult, result)
  }

}
