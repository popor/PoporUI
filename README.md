<a href='https://github.com/popor/mybox'> MyBox </a>

# PoporUI

[![CI Status](https://img.shields.io/travis/wangkq/PoporUI.svg?style=flat)](https://travis-ci.org/wangkq/PoporUI)
[![Version](https://img.shields.io/cocoapods/v/PoporUI.svg?style=flat)](https://cocoapods.org/pods/PoporUI)
[![License](https://img.shields.io/cocoapods/l/PoporUI.svg?style=flat)](https://cocoapods.org/pods/PoporUI)
[![Platform](https://img.shields.io/cocoapods/p/PoporUI.svg?style=flat)](https://cocoapods.org/pods/PoporUI)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

PoporUI is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'PoporUI'

兼容iOS和macOS系统
~~BlockView : iOS8以前的UIAlertView、UIActionSheet采用block模式~~
IToast : 整理了IToast，import IToastPTool.h 使用AlertToastTitle(title)，弹出键盘弹出的时候IToast弹出高度自动上移。
ProgressView : 使用了 https://github.com/gin0606插件。
Response : 根据UIResponder传递事件。
Tool : 包含磁盘空间、设备使用权限、保存图片、APP版本号等信息。
UIButton : 主要是UIButtonLayoutCustom，通过block方式自定义UIButton图片文字frame。
UIDeviceScreen : 获取是否是iPhoneX设备接口。
UIImage : 根据UIColor、NSString、UIFont、UIImage、UIView生成图片，渐变色图片，
-   更改UIImage填充色和背景色，保存图片到指定路径，读取绝对路径图片，压缩图片（指定最大容量、根据size压缩）。
UILabel : 根据UIString、UIFont或者NSAttributedString计算size，
-   UILabelInsets，UILabelPhone。
UINavigationController : 根据Class、index移除某个UIViewController。
UIScrollView : 滑动到最底部，包含 UIScrollView 的VC支持侧滑。
UITableView : UITableViewCell 设定分割线inset。
-   侧滑VC的时候，UITableViewCell跟随滑动渐变色。
UITextField : UIInsetsTextField，UITextField最大输入文字，可以使用RAC替换。
UITextView : UIPasteImageTextView，
-   UIPlaceHolderTextView，
-   UITextView (MaxLength)，
-   UITextView (Size)
UIView : UIView (Extension)
UIViewController : UIViewController (AC: iPad弹出UIAlertControl sheet 模式的时候不崩溃，设定默认popPresenter.sourceRect)，
-   设定导航栏按钮，
-   导航栏是否隐藏BOOL，
-   UIViewController (TapEndEdit: 点击空白处关闭键盘，键盘高度变化接口)。

```
#### 0.0.46
UINavigationController 增加静态方法 statusBarHeight



## Author

wangkq, 908891024@qq.com

## License

PoporUI is available under the MIT license. See the LICENSE file for more info.
