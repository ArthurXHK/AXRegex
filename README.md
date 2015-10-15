# AXRegex
Let's use Regex in a easy way with Swift.

[![CI Status](http://img.shields.io/travis/Arthur XU/AXRegex.svg?style=flat)](https://travis-ci.org/Arthur XU/AXRegex)
[![Version](https://img.shields.io/cocoapods/v/AXRegex.svg?style=flat)](http://cocoapods.org/pods/AXRegex)
[![License](https://img.shields.io/cocoapods/l/AXRegex.svg?style=flat)](http://cocoapods.org/pods/AXRegex)
[![Platform](https://img.shields.io/cocoapods/p/AXRegex.svg?style=flat)](http://cocoapods.org/pods/AXRegex)

## Why

Just want to implement a easy way to use regex in Swift.

简简单单调用正则表达式 (￣^￣)ゞ

## Usage

You can match regex like this:

你可以这样用:

```swift
let regex = Regex("^[a-zA-Z0-9_-]{6,18}$")
regex.match("userNameA") // Return Bool
regex.match("userNameB") // Return Bool
```

or this:

或者这样用:

```swift
regexMatch("userName", pattern: "^[a-zA-Z0-9_-]{6,18}$") // Return Bool
```

even this:

甚至这样用:

```swift
"userName".regex("^[a-zA-Z0-9_-]{6,18}$") // Return Bool
```

But my favorites is like this:

不过我还是最喜欢这样用:

```swift
"userName" =~ "^[a-zA-Z0-9_-]{6,18}$" // Return Bool
``` 

It also prepares some common pattern: Email, Website, IP Address, etc. Welcome for adding more.

还准备了一些常用的正则, 如: 邮箱, 网址, IP地址, 等等(欢迎大家来补充)。

```swift
"http://www.google.com" =~ RegexPattern().WebSite
```

## Requirements

* Swift 2.0

## Installation with CocoaPods

AXRegex is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
platform :ios, '8.0'
pod 'AXRegex', :git => 'https://github.com/ArthurXHK/AXRegex.git'
```

## Author

Arthur XU, arthurk.dev@gmail.com

## License

AXRegex is available under the Apache License 2.0. See the LICENSE file for more info.
