#
#  Be sure to run `pod spec lint RxSwiftFlux.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "RxSwiftFlux"
  s.version      = "1.0.0"
  s.summary      = "Flux Implimentation using RxSwift for Swift."
  s.homepage     = "https://github.com/cam-hop/RxSwiftFlux"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "cam-hop" => "yangahe@gmail.com" }
  s.platform     = :ios, "9.1"
  s.source       = { :git => "https://github.com/cam-hop/RxSwiftFlux.git", :tag => s.version.to_s }
  s.source_files  = "RxSwiftFlux/*.swift", "RxSwiftFlux/RxSwiftFlux.h"

  s.dependency "RxSwift", "~> 3.5.0"

end
