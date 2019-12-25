//
//  MinutesTests.swift
//  MinutesTests
//
//  Created by Ankur Lahiry on 25/12/19.
//  Copyright © 2019 Microsoft. All rights reserved.
//

import XCTest
@testable import Minutes

class MinutesTests: XCTestCase {
    
    var entryUnderTest : Entry!

    override func setUp() {
        super.setUp()
        entryUnderTest = Entry("Title", "Content")
    }

    override func tearDown() {
        super.tearDown()
        entryUnderTest = nil
    }
    
    func testSerialization() {
        
        let serializedData = FileEntryStore.serialize(entryUnderTest)
        let deserializedData = FileEntryStore.deserialize(serializedData!)
        
        XCTAssertEqual(deserializedData?.title, "Title", "Title didn't matched")
        XCTAssertEqual(deserializedData?.content, "Content", "Content didn't matched")
        
    }

}
