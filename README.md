# DAIconFont

[![CI Status](https://img.shields.io/travis/leehonn/DAIconFont.svg?style=flat)](https://travis-ci.org/leehonn/DAIconFont)
[![Version](https://img.shields.io/cocoapods/v/DAIconFont.svg?style=flat)](https://cocoapods.org/pods/DAIconFont)
[![License](https://img.shields.io/cocoapods/l/DAIconFont.svg?style=flat)](https://cocoapods.org/pods/DAIconFont)
[![Platform](https://img.shields.io/cocoapods/p/DAIconFont.svg?style=flat)](https://cocoapods.org/pods/DAIconFont)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

DAIconFont is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'DAIconFont'
```
## How To Use
``` objc
//UILabel加载的方式
……
label.font = [UIFont iconFontOfSize:22];
label.text = @"\U0000e70c";

//当做Image加载的方式
……
TBCityIconInfo *info = [[TBCityIconInfo alloc] initWithText:@"\U0000e70c" size:60 color:[UIColor redColor]];
imgView.image = [UIImage iconWithInfo:info];
```
## Author

leehonn, explorer.long@gmail.com

## License

DAIconFont is available under the MIT license. See the LICENSE file for more info.
