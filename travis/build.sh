#!/bin/sh
set -e

xcodebuild ONLY_ACTIVE_ARCH=NO -scheme iOSSpecs -sdk iphonesimulator6.1 -configuration Debug clean build -workspace ObjectiveCSlim.xcworkspace
