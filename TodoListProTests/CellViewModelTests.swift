//
//  viewModelTests.swift
//  TodoListProTests
//
//  Created by Hamed Amiry on 11.08.2021.
//

import XCTest
@testable import TodoListPro

class viewModelTests: XCTestCase {

    func test_the_user() {
        

        let n = CellViewModel.init(name: "", subName: "")
        XCTAssertTrue(n.name == "")
        XCTAssertTrue(n.subName == "")
    }
    

}
