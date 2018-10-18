#
# Be sure to run `pod lib lint PoporUI.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
# 

Pod::Spec.new do |s|
  s.name             = 'PoporUI'
  s.version          = '0.0.20'
  s.summary          = 'Contain Itoast;
  UIButton,UILabel,UITextView,UITextField extention;
  '
  
  s.homepage         = 'https://github.com/popor/PoporUI'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'popor' => '908891024@qq.com' }
  s.source           = { :git => 'https://github.com/popor/PoporUI.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'PoporUI/Classes/PoporUI.h'
  
  
  #-----------------------
  s.subspec 'BlockView' do |ss|
      ss.source_files = 'PoporUI/Classes/BlockView/*.{h,m}'
  end
  
  s.subspec 'IToast' do |ss|
      ss.ios.dependency 'PoporFoundation/NSString'
      
      ss.source_files = 'PoporUI/Classes/IToast/*.{h,m}'
  end
  
  #  s.subspec 'KeyBoard' do |ss|
  #      ss.source_files = 'PoporUI/Classes/KeyBoard/*.{h,m}'
  #  end
  
  s.subspec 'Response' do |ss|
      ss.source_files = 'PoporUI/Classes/Response/*.{h,m}'
  end
  
  #  s.subspec 'SimpleWKWebVC' do |ss|
  #      ss.ios.dependency 'PoporUI/IToast'
  #
  #      ss.source_files = 'PoporUI/Classes/SimpleWKWebVC/*.{h,m}'
  #  end
  
  
  #-----------------------
  s.subspec 'Tool' do |ss|
      ss.ios.dependency 'PoporUI/IToast'
      ss.ios.dependency 'PoporUI/BlockView'
      ss.ios.dependency 'PoporFoundation/NSString'
      
      ss.source_files = 'PoporUI/Classes/Tool/*.{h,m}'
  end
  
  s.subspec 'UIButton' do |ss|
      ss.ios.dependency 'PoporFoundation/PrefixCore'
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
      ss.source_files = 'PoporUI/Classes/UITextField/*.{h,m}'
  end
  
  s.subspec 'UITextView' do |ss|
      ss.source_files = 'PoporUI/Classes/UITextView/*.{h,m}'
  end
  
  s.subspec 'UIView' do |ss|
      ss.source_files = 'PoporUI/Classes/UIView/*.{h,m}'
  end
  
  s.subspec 'UIViewController' do |ss|
      ss.ios.dependency 'PoporFoundation/PrefixCore'
      ss.ios.dependency 'PoporFoundation/NSObject'
      ss.ios.dependency 'PoporFoundation/NSString'
      
      ss.source_files = 'PoporUI/Classes/UIViewController/*.{h,m}'
  end
  
  s.subspec 'UINavigationController' do |ss|
      ss.source_files = 'PoporUI/Classes/UINavigationController/*.{h,m}'
  end
  
  s.subspec 'ProgressView' do |ss|
      ss.source_files = 'PoporUI/Classes/ProgressView/*.{h,m}'
  end
  
  s.subspec 'UIDeviceScreen' do |ss|
      ss.source_files = 'PoporUI/Classes/UIDeviceScreen/*.{h,m}'
  end
  
  
  #-----------------------
  
  s.platform     = :ios, "8.0"
  
  #s.dependency 'PoporFoundation'
  
end
