Pod::Spec.new do |s|
  s.name             = "FluentDarkModeKitOC"
  s.version          = "1.0.6"
  s.summary          = "Rewrite FluentDarkModeKit for a library for backporting Dark Mode in iOS. Use objective-c replace swift."

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

  s.source_files     = 'FluentDarkModeKitOC/DarkModeCore/**/*.{h,m}', 'FluentDarkModeKitOC/FluentDarkModeKit/**/*.{h,m}'
end
