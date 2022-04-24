//
//  ChapterOneTests.swift
//  grokking-algorithmsTests
//
//  Created by Евгений Киртаев on 16.01.2022.
//  Copyright © 2022 Евгений Киртаев. All rights reserved.
//

import XCTest

class ChapterOneTests: XCTestCase {
  
  func testBinarySearch() {
    //given
    let chapter = ChapterOneClass()
    let inputList = [1, 3, 5, 7, 9]
    let inputItem = 3
    let expectedResult: NSNumber = NSNumber(value: 1)
    
    //when
    let result = chapter.binarySearch(sortedList: inputList, item: inputItem)
    
    //then
    XCTAssertEqual(expectedResult, result)
  }

}
