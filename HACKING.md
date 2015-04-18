General Hacking information.

Or what to do if Xcode plays stupid.

This worked in XCode 6.3

When integrating swifter it refused to compile all of a sudden.
With all kinds of strange errors.

Make Clean
CLOSE XCODE
rm -rf ~/Library/Developer/Xcode/DerivedData/*
getconf DARWIN_USER_CACHE_DIR
rm -rf /var/folders/0y/74pbjz412t1_kbt90_ql4qs40000gn/C/org.llvm.clang/ModuleCache


In case you have unwanted Source Control Targets etc:

vi Travel\ in\ Silence.xcodeproj/project.xcworkspace/xcshareddata/Travel\ in\ Silence.xccheckout

You will figure it out ;)