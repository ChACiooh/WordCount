//
//  WordCountTests.swift
//  WordCountTests
//
//  Created by Lingostar on 2016. 1. 24..
//  Copyright © 2016년 CodersHigh. All rights reserved.
//

import XCTest
@testable import WordCount

class WordCountTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func WordCount(words: String) -> [String:Int] {
        var result : [String:Int] = [:]
        let token = " ,./;:`~\'\"!@#$%^&*()-+_=[]{}|\\?<>"
        let wordsInWords = words.components(separatedBy: token)
        for var str:String in wordsInWords {
            str = str.lowercased()
            if result[str] != nil {
                result[str]! += 1
            } else {
                result[str] = 1
            }
        }
        return result
    }
    
    
    func testCountOneWord() {
        let result = WordCount(words: "word")
        let expected = ["word": 1]
        //let result = words.count()
        
        XCTAssertEqual(expected, result)
    }
    
    func testCountOneOfEeach() {
        let result = WordCount(words: "one of each")
        let expected = ["one" : 1, "of" : 1, "each" : 1 ]
        //let result = words.count();
        
        XCTAssertEqual(expected, result)
    }
    
    func testCountMultipleOccurrences() {
        let result = WordCount(words: "one fish two fish red fish blue fish")
        let expected = ["one" : 1, "fish" : 4, "two" : 1, "red" : 1, "blue" : 1 ]
        //let result = words.count()
        
        XCTAssertEqual(expected, result)
    }
    
    func testIgnorePunctation() {
        let result = WordCount(words: "car : carpet as java : javascript!!&$%^&")
        let expected = ["car" : 1, "carpet" : 1, "as" : 1, "java" : 1, "javascript" : 1 ]
        //let result = words.count()
        
        XCTAssertEqual(expected, result)
    }
    
    func testIncludeNumbers() {
        let result = WordCount(words: "testing, 1, 2 testing")
        let expected = [ "testing" : 2, "1" : 1, "2" : 1 ]
        //let result = words.count()
        
        XCTAssertEqual(expected, result)
    }
    
    func testNormalizeCase() {
        let result = WordCount(words:"go Go GO")
        let expected = [ "go" : 3]
        //let result = words.count()
        
        XCTAssertEqual(expected, result)
    }
    
}
