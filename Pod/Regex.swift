//
//  Regex.swift
//  AXRegex
//
//  Created by Arthur XU on 13/10/15.
//  Copyright © 2015年 Arthur XU. All rights reserved.
//

import Foundation

public struct RegexResult {
    
    public let text: String
    public var matches = [(content:String, range: NSRange, type: NSTextCheckingType)]()
    
    public init(_ text: String) {
        self.text = text
    }
    
    public var hasMatch: Bool {
        return self.matches.count>0
    }
    public var isCompleteMatch: Bool {
        guard self.matches.count==1 else {return false}
        return self.matches[0].content.characters.count==self.text.characters.count
    }
}

public struct Regex {
    
    public var regex: NSRegularExpression?
    
    public init(_ pattern: String, options: NSRegularExpressionOptions=[]) {
        do{
            regex = try NSRegularExpression(pattern: pattern, options:options)
        } catch {
            print("Fail to init Regex with pattern[\(pattern)]")
        }
    }
    
    public func match(text: String) -> RegexResult {
        var result = RegexResult(text)
        guard let regex = self.regex else {return result}
        let matches = regex.matchesInString(text, options: .ReportCompletion, range: NSMakeRange(0, text.characters.count))
        for matchResult in matches {
            let content = (text as NSString).substringWithRange(matchResult.range)
            result.matches.append((content, matchResult.range, matchResult.resultType))
        }
        return result
    }
}

public func regexMatch(text: String, pattern: String, options: NSRegularExpressionOptions=[]) -> RegexResult {
    var result = RegexResult(text)
    do{
        let regex = try NSRegularExpression(pattern: pattern, options:options)
        let matches = regex.matchesInString(text, options:.ReportCompletion, range: NSMakeRange(0, text.characters.count))
        for matchResult in matches {
            let content = (text as NSString).substringWithRange(matchResult.range)
            result.matches.append((content, matchResult.range, matchResult.resultType))
        }
    } catch {
        print("Fail to init Regex with pattern[\(pattern)]")
    }
    return result
}

infix operator =~ {
associativity none
precedence 130
}
public func =~ (lhs: String, rhs: String) -> RegexResult {
    return regexMatch(lhs, pattern: rhs)
}

extension String {
    public func regex(pattern: String) -> RegexResult {
        return regexMatch(self, pattern: pattern)
    }
}
