import UIKit
import XCTest
import AXRegex

class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testRegexStruct() {
        self.measureBlock {
            let regex = Regex(RegexPattern().Email)
            if !regex.match("abcdefg@gmail.com") {
                XCTAssert(false)
            }
            if regex.match("123abc@!#!#@gmail.com") {
                XCTAssert(false)
            }
            
        }
    }
    
    func testRegexOperator() {
        self.measureBlock {
            if !("abcABC123" =~ RegexPattern().UserName) {
                XCTAssert(false)
            }
        }
    }
    
    func testRegexString() {
        self.measureBlock {
            if !("http://www.google.com".regex(RegexPattern().WebSite)) {
                XCTAssert(false)
            }
        }
    }
    
}
