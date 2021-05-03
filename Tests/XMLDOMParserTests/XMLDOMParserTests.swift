//
//  XMLDOMParserTests.swift
//  XMLDOMParserTests
//
//  Created by EnchantCode on 2021/05/03.
//

import XCTest
@testable import XMLDOMParser

final class XMLDOMParserTests: XCTestCase {
    
    func testParseXML() throws {
        let XMLString = """
        <?xml version="1.0" encoding="UTF-8"?>
        <document type="net.enchan-lab.StoryboardAnalyserEx.sample.xml" version="3.0">
            プレーンテキストです。
            <elem id="" class="">
                要素内のテキストです。
                <p id="">
                    <b>
                        タグと要素が混合した
                    </b>
                    テキストです。
                </p>
            </elem>
        </document>
        """
        
        let parser = XMLDOMParser(data: XMLString.data(using: .utf8)!)
        parser.parse { (node) in
            print(node)
        } failure: { (error) in
            print(error)
        }
    }
    
    static var allTests = [
        ("testParseXML", testParseXML),
    ]
}
