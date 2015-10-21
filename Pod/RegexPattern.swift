//
//  RegexPattern.swift
//  Pods
//
//  Created by Arthur XU on 17/10/15.
//
//

import Foundation

public struct RegexPattern {
    
    public static let Email: String = {
        return "([a-zA-Z0-9_\\.-]+)@([a-zA-Z0-9\\.-]+)\\.([a-zA-Z\\.]{2,6})"
        }()
    public static let WebSite: String = {
        return "(https?:\\/\\/)?([a-zA-Z0-9\\.-]+)\\.([a-zA-Z\\.]{2,6})([\\/\\w \\.-]*)*\\/?"
        }()
    public static let IPAddress: String = {
        return "(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)"
        }()
    public static let HtmlTag: String = {
        return "<[\\/]?[a-zA-Z]+(\\s+[a-zA-Z]+\\s*[=]\\s*[\"]\\w+[\"])*\\s*(?:[\\/]?|>\\w*<\\/[a-zA-Z]+)>"
        }()
    public static let Number: String = {
        return "[0-9]+([.][0-9]+)?"
        }()
    public static let Chinese: String = {
        return "[\\u4e00-\\u9fa5]+"
        }()
    
    public static func userName(lowerLimit: UInt, upperLimit: UInt) -> String {
        return "[a-zA-Z][a-zA-Z0-9_]{\(lowerLimit-1),\(upperLimit-1)}"
    }
    public static func password(lowerLimit: UInt, upperLimit: UInt) -> String {
        return "[a-zA-Z0-9_]{\(lowerLimit-1),\(upperLimit-1)}"
    }
    
}
