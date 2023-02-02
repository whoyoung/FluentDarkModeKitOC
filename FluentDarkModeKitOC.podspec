Pod::Spec.new do |s|
  s.name             = "FluentDarkModeKitOC"
  s.version          = "1.0.4"
  s.summary          = "A library for backporting Dark Mode in iOS"

  s.description      = <<-DESC
                       FluentDarkModeKit provides a mechanism to support dark mode for apps on iOS 11+ (including iOS 13).
                       DESC
  s.homepage         = "https://github.com/whoyoung/FluentDarkModeKitOC"
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = "whoyoung"
  s.source           = { :git => "https://github.com/whoyoung/FluentDarkModeKitOC.git", :tag => s.version.to_s }
  s.platform         = :ios, '11.0'
  s.requires_arc     = true
  s.frameworks       = 'UIKit', 'Foundation'
  s.swift_version    = '5.0'

  s.source_files     = 'FluentDarkModeKitOC/DarkModeCore/*.{h,m}', 'FluentDarkModeKitOC/FluentDarkModeKit/**/*.{h,m}'
end
