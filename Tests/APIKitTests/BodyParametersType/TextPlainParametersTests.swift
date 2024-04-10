import Foundation
import XCTest
import APIKit

class TextPlainParametersTests: XCTestCase {
    func testTextPlainSuccess() throws {
       let text = "Hello, World!"
       let parameters = TextPlainParameters(text: text)
       
       XCTAssertEqual(parameters.contentType, "text/plain")
       
       guard case .data(let data) = try parameters.buildEntity() else {
           XCTFail()
           return
       }
       
       let decodedText = String(data: data, encoding: .utf8)
       XCTAssertEqual(decodedText, text)
    }

    func testTextPlainEmpty() throws {
       let text = ""
       let parameters = TextPlainParameters(text: text)
       
       XCTAssertEqual(parameters.contentType, "text/plain")
       
       guard case .data(let data) = try parameters.buildEntity() else {
           XCTFail()
           return
       }
       
       let decodedText = String(data: data, encoding: .utf8)
       XCTAssertEqual(decodedText, text)
    }

    func testTextPlainUnicode() throws {
        let text = "Hello, World! 😄🌍"
        let parameters = TextPlainParameters(text: text)
        
        XCTAssertEqual(parameters.contentType, "text/plain")
        
        guard case .data(let data) = try parameters.buildEntity() else {
            XCTFail()
            return
        }
        
        let decodedText = String(data: data, encoding: .utf8)
        XCTAssertEqual(decodedText, text)
    }
}
