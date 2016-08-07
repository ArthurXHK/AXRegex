//
//  RegexPattern.swift
//  Pods
//
//  Created by Arthur XU on 17/10/15.
//
//

import Foundation

public struct RegexPattern {
    
    public static let EmailPattern     = "([a-zA-Z0-9_\\.-]+)@([a-zA-Z0-9\\.-]+)\\.([a-zA-Z\\.]{2,6})"
    public static let WebSitePattern   = "(https?:\\/\\/)?([a-zA-Z0-9\\.-]+)\\.([a-zA-Z\\.]{2,6})([\\/\\w \\.-]*)*\\/?"
    public static let IPAddressPattern = "(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)"
    public static let HtmlTagPattern   = "<[\\/]?[a-zA-Z]+(\\s+[a-zA-Z]+\\s*[=]\\s*[\"]\\w+[\"])*\\s*(?:[\\/]?|>\\w*<\\/[a-zA-Z]+)>"
    public static let NumberPattern    = "[0-9]+([.][0-9]+)?"
    public static let ChinesePattern   = "[\\u4e00-\\u9fa5]+"
    
    public static func userNamePattern(minLength: UInt, maxLength: UInt) -> String {
        return "[a-zA-Z][a-zA-Z0-9_]{\(minLength-1),\(maxLength-1)}"
    }
    public static func passwordPattern(minLength: UInt, maxLength: UInt) -> String {
        return "[a-zA-Z0-9_]{\(minLength-1),\(maxLength-1)}"
    }
    
}
