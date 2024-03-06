#!/bin/bash
oldPath=`pwd`
echo $oldPath'打印当前目录'
currentPath=$(cd `dirname $0`; pwd)  #当前脚本目录

cd $currentPath'/'ios 
pod install 
#编译
xcodebuild -scheme AHReactNativeSDK -workspace AHReactNativeSDK.xcworkspace CONFIGURATION_BUILD_DIR=$1/React-Core PODS_CONFIGURATION_BUILD_DIR=$1   ARCHS='arm64' -destination  generic/platform=iOS  -configuration $2 build
if [ ! -e $1/React-Core/AHReactNativeSDK.framework/AHReactNativeSDK ];then
    echo 'error:编译失败'
    exit 88
fi
echo '编译成功'
cp -rvf $1/React-Core/AHReactNativeSDK.framework $1
rm -rvf $1/AHReactNativeSDK.framework/AccessibilityResources.bundle
mkdir $1/Headers
mkdir $1/Headers/AHReactNativeSDK.framework
cp -rvf $1/AHReactNativeSDK.framework/Headers $1/Headers/AHReactNativeSDK.framework
if [ -d $1/React-Core/AHReactNativeSDK.framework.dSYM ];then
    cp -rvf $1/React-Core/AHReactNativeSDK.framework.dSYM $1
fi
cd $oldPath
echo 'rnsdk.sh 脚本执行完成'
