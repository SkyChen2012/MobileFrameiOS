# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

target 'MobileFrame' do
  # Uncomment the next line if you're using Swift or would like to use dynamic frameworks
  # use_frameworks!

  # Pods for MobileFrame
#代码注入
pod 'XAspect'

#日志系统
pod 'CocoaLumberjack', '~>3.2.0'

#开发工具，可以用来Debug view，分析网络请求
pod 'FLEX', '~> 2.0', :configurations => ['Debug']

#键盘处理
pod 'IQKeyboardManager', '~> 3.3.7'  #兼容IOS7

#NetWorking
pod 'YTKNetwork', '~> 2.0.4'

#低耦合集成TabBarController
pod 'CYLTabBarController'

#iOS自动布局框架
pod 'Masonry'
# 数据库

pod 'FMDB', '~> 2.7.2'

#个推SDK
pod 'GTSDK'  

# MQTT
pod 'MQTTClient', '~> 0.14.0'

# 菊花
pod 'MBProgressHUD', '~> 1.1.0'

# 'node_modules'目录一般位于根目录中
# 但是如果你的结构不同，那你就要根据实际路径修改下面的`:path`
pod 'React', :path => '../AppReactNativeFrameServer/node_modules/react-native', :subspecs => [
    'Core',
    'CxxBridge', # 如果RN版本 >= 0.45则加入此行
    'DevSupport', # 如果RN版本 >= 0.43，则需要加入此行才能开启开发者菜单
    'RCTText',
    'RCTNetwork',
    'RCTWebSocket', # 这个模块是用于调试功能的
    # 在这里继续添加你所需要的RN模块
]
# 如果你的RN版本 >= 0.42.0，则加入下面这行
pod 'yoga', :path => '../AppReactNativeFrameServer/node_modules/react-native/ReactCommon/yoga'

# 如果RN版本 >= 0.45则加入下面三个第三方编译依赖
pod 'DoubleConversion', :podspec => '../AppReactNativeFrameServer/node_modules/react-native/third-party-podspecs/DoubleConversion.podspec'
pod 'glog', :podspec => '../AppReactNativeFrameServer/node_modules/react-native/third-party-podspecs/GLog.podspec'
pod 'Folly', :podspec => '../AppReactNativeFrameServer/node_modules/react-native/third-party-podspecs/Folly.podspec'


end
