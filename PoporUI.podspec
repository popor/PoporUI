#
# Be sure to run `pod lib lint PoporUI.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PoporUI'
  s.version          = '0.0.1'
  s.summary          = 'Contain Itoast;
  UIButton,UILabel,UITextView,UITextField extention;
  
  '

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

#  s.description      = <<-DESC
#TODO: Add long description of the pod here.
#                       DESC

  s.homepage         = 'https://github.com/popor/PoporUI'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wangkq' => '908891024@qq.com' }
  s.source           = { :git => 'https://github.com/popor/PoporUI.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'PoporUI/Classes/PoporUI.h'
  
  
  #-----------------------
  s.subspec 'BlockView' do |ss|
      ss.source_files = 'PoporUI/Classes/BlockView/*.{h,m}'
  end
  
  s.subspec 'IToast' do |ss|
      ss.source_files = 'PoporUI/Classes/IToast/*.{h,m}'
  end
  
  #  s.subspec 'KeyBoard' do |ss|
  #      ss.source_files = 'PoporUI/Classes/KeyBoard/*.{h,m}'
  #  end
  
  s.subspec 'Response' do |ss|
      ss.source_files = 'PoporUI/Classes/Response/*.{h,m}'
  end
  
  s.subspec 'SimpleWKWebVC' do |ss|
      ss.ios.dependency 'PoporUI/IToast'
      ss.ios.dependency 'Masonry'
      
      ss.source_files = 'PoporUI/Classes/SimpleWKWebVC/*.{h,m}'
  end
  
  
  #-----------------------
  s.subspec 'Tool' do |ss|
      ss.ios.dependency 'PoporUI/IToast'
      ss.ios.dependency 'PoporUI/BlockView'
      ss.ios.dependency 'PoporFoundation/NSString'
      
      ss.source_files = 'PoporUI/Classes/Tool/*.{h,m}'
  end
  
  s.subspec 'UIButton' do |ss|
      ss.ios.dependency 'PoporFoundation/prefix'
      ss.ios.dependency 'PoporUI/UIView'
      ss.ios.dependency 'PoporUI/UIImage'
      
      ss.source_files = 'PoporUI/Classes/UIButton/*.{h,m}'
  end
  
  s.subspec 'UIImage' do |ss|
      ss.source_files = 'PoporUI/Classes/UIImage/*.{h,m}'
  end
  
  s.subspec 'UILabel' do |ss|
      ss.ios.dependency 'PoporFoundation/NSString'
      ss.ios.dependency 'PoporUI/UIView'
      
      ss.source_files = 'PoporUI/Classes/UILabel/*.{h,m}'
  end
  
  s.subspec 'UIScrollView' do |ss|
      ss.source_files = 'PoporUI/Classes/UIScrollView/*.{h,m}'
  end
  
  #-----------------------
  s.subspec 'UITableView' do |ss|
      ss.source_files = 'PoporUI/Classes/UITableView/*.{h,m}'
  end
  
  s.subspec 'UITextField' do |ss|
      ss.ios.dependency 'ReactiveObjC'
      
      ss.source_files = 'PoporUI/Classes/UITextField/*.{h,m}'
  end
  
  s.subspec 'UITextView' do |ss|
      ss.source_files = 'PoporUI/Classes/UITextView/*.{h,m}'
  end
  
  s.subspec 'UIView' do |ss|
      ss.source_files = 'PoporUI/Classes/UIView/*.{h,m}'
  end
  
  s.subspec 'UIViewController' do |ss|
      ss.ios.dependency 'PoporFoundation/prefix'
      ss.ios.dependency 'PoporFoundation/NSObject'
      ss.ios.dependency 'PoporFoundation/NSString'
      
      ss.source_files = 'PoporUI/Classes/UIViewController/*.{h,m}'
  end
  #-----------------------
  
  s.platform     = :ios, "8.0"
  
  s.dependency 'PoporFoundation'
  s.dependency 'ReactiveObjC'
  s.dependency 'Masonry'
  
end
