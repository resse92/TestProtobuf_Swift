#
# Be sure to run `pod lib lint SubProtobuf.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SubProtobuf'
  s.version          = '0.1.0'
  s.summary          = 'A short description of SubProtobuf.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
 Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/chenmu/SubProtobuf'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'chenmu' => 'chenmu@xiaohongshu.com' }
  s.source           = { :git => 'https://github.com/chenmu/SubProtobuf.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'

  s.source_files = ['SubProtobuf/Classes/**/*', 'out/include/**/*.h']
  s.prepare_command = "echo ${CWD}; make ios"

  # s.vendored_libraries = 'out/**/*.a'
 s.vendored_frameworks = 'out/*.xcframework'
#  s.public_header_files = ['out/**/*.h']

  s.dependency 'SwiftProtobuf'
  # s.xcconfig = { 'FRAMEWORK_SEARCH_PATHS' => 'out/' }

end

# 我有一个xcframework，结构如下 - libStatic.xcframework: - Info.plist - ios-arm64 - libStatic.a - ios-x86_64-simulator - libStatic.a，还有一个header文件是libStatic的，在podspec里通过source_files引用,我在podspec里面是通过vendered_frameworks=‘libStatic.xcframework'引用的，我在主工程里面引用了header文件里的对象，报错undefined_symbol，问题出在哪
