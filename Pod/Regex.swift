//
//  Regex.swift
//  AXRegex
//
//  Created by Arthur XU on 13/10/15.
//  Copyright © 2015年 Arthur XU. All rights reserved.
//

import Foundation

public struct RegexPattern {
    public init() {}
    
    public let Email     = "^([a-zA-Z0-9_\\.-]+)@([a-zA-Z0-9\\.-]+)\\.([a-zA-Z\\.]{2,6})$"
    public let UserName  = "^[a-zA-Z0-9_-]{6,18}$"
    public let Password  = "^[a-zA-Z0-9_-]{8,18}$"
    public let WebSite   = "^(https?:\\/\\/)?([a-z0-9\\.-]+)\\.([a-z\\.]{2,6})([\\/\\w \\.-]*)*\\/?$"
    public let IPAddress = "^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$"
    public let htmlTag   = "^<([a-z]+)([^<]+)*(?:>(.*)<\\/\\1>|\\s+\\/>)$"
    public let Number    = "^\\d+([.]\\d+)?$"
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
    
    public func match(text: String) -> Bool {
        guard let regex = self.regex else {return false}
        let matches = regex.matchesInString(text, options: .ReportCompletion, range: NSMakeRange(0, text.characters.count))
        return matches.count > 0
    }
}

public func regexMatch(text: String, pattern: String, options: NSRegularExpressionOptions=[]) -> Bool {
    do{
        let regex = try NSRegularExpression(pattern: pattern, options:options)
        let matches = regex.matchesInString(text, options: .ReportCompletion, range: NSMakeRange(0, text.characters.count))
        return matches.count > 0
    } catch {
        print("Fail to init Regex with pattern[\(pattern)]")
    }
    return false
}

infix operator =~ {
associativity none
precedence 130
}
public func =~ (lhs: String, rhs: String) -> Bool {
    return regexMatch(lhs, pattern: rhs)
}

extension String {
    public func regex(pattern: String) -> Bool {
        return regexMatch(self, pattern: pattern)
    }
}
