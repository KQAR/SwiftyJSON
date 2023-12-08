//
//  DynamicMemberLookupTests.swift
//  SwiftyJSON
//
//  Created by Jarvis on 2023/12/8.
//

import XCTest
import SwiftyJSON

final class DynamicMemberLookupTests: XCTestCase {

  let family: JSON = [
      "names": [
          "Brooke Abigail Matos",
          "Rowan Danger Matos"
      ],
      "motto": "Hey, I don't know about you, but I'm feeling twenty-two! So, release the KrakenDev!",
      "memberCount": 2,
      "isMarried": false
  ]
  
  func testDynamicMemberLookup() throws {
    let name1 = family.names.arrayValue.map(\.stringValue)
    let name2 = family["names"].arrayValue.map(\.stringValue)
    
    let motto1 = family.motto.stringValue
    let motto2 = family["motto"].stringValue
    
    let count1 = family.memberCount.intValue
    let count2 = family["memberCount"].intValue
    
    let isMarried1 = family.isMarried.boolValue
    let isMarried2 = family["isMarried"].boolValue
    
    XCTAssertEqual(name1, name2)
    XCTAssertEqual(name1, [
      "Brooke Abigail Matos",
      "Rowan Danger Matos"
    ])
    
    XCTAssertEqual(motto1, motto2)
    XCTAssertEqual(motto1, "Hey, I don't know about you, but I'm feeling twenty-two! So, release the KrakenDev!")
    
    XCTAssertEqual(count1, count2)
    XCTAssertEqual(count1, 2)
    
    XCTAssertEqual(isMarried1, isMarried2)
    XCTAssertEqual(isMarried1, false)
  }

  func testPerformanceMeasureDynamicMemberLookup() throws {
    measure {
      for _ in 0...1000 {
        let name1 = family.names.arrayValue.map(\.stringValue)
        let motto1 = family.motto.stringValue
        let count1 = family.memberCount.intValue
        let isMarried1 = family.isMarried.boolValue
      }
    }
  }
}
