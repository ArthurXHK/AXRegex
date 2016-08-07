//
//  Regex.swift
//  AXRegex
//
//  Created by Arthur XU on 13/10/15.
//  Copyright © 2015年 Arthur XU. All rights reserved.
//

import Foundation

public struct RegexResult {
    
    public typealias MatchTypes = (content:String, range:NSRange, type:TextCheckingResult.CheckingType)
    
    public let text: String
    public var matches = [MatchTypes]()
    
    public init(text: String) {
        self.text = text
    }
    
    public var hasMatch: Bool {
        return self.matches.count>0
    }
}

extension RegularExpression {
    public func match(text: String) -> RegexResult {
        var result = RegexResult(text:text)
        let matches = self.matches(in: text, options: .reportCompletion, range: NSRange(location: 0, length: text.characters.count))
        for matchResult in matches {
            let content = (text as NSString).substring(with:matchResult.range)
            result.matches.append((content, matchResult.range, matchResult.resultType))
        }
        return result
    }
}

public func regexMatch(text: String, pattern: String, options: RegularExpression.Options=[]) -> RegexResult? {
    let regex: RegularExpression;
    do{
        regex = try RegularExpression(pattern: pattern, options: options)
    } catch {
        print("Fail to init Regex with pattern[\(pattern)]")
        return nil
    }
    return regex.match(text: text);
}

infix operator =~ {
    associativity none
    precedence 130
}
public func =~ (lhs: String, rhs: String) -> RegexResult? {
    return regexMatch(text: lhs, pattern: rhs)
}

extension String {
    public func regex(_ pattern: String) -> RegexResult? {
        return regexMatch(text: self, pattern: pattern)
    }
}
