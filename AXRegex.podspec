Pod::Spec.new do |s|
  s.name    = "AXRegex"
  s.version = "0.1.0"
  s.summary = "A easy way to use regex in Swift."

  s.description = <<-DESC
                    Try to implement a easy way to use regex in Swift.
                  DESC

  s.homepage = "https://github.com/ArthurXHK/AXRegex"
  s.license  = { :type => 'Apache License 2.0', :file => 'LICENSE' }
  s.author   = { "Arthur XU" => "arthurk.dev@gmail.com" }
  s.source   = {
    :git => "https://github.com/ArthurXHK/AXRegex.git",
    :tag => s.version.to_s
  }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/*.swift'
  s.frameworks = 'Foundation'

end
