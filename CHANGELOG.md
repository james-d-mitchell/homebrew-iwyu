### homebrew-iwyu v5.0.0 (January 11, 2017) ###

* Installs include-what-you-use 0.7 (based on clang 3.8.0)

* Removes brittle Xcode-symlink workaround

* Relies on compiler builtin headers included in iwyu

* Relies on iwyu's new macOS header path logic

* Adds Xcode 8.0, 8.1, and 8.2 to build matrix

* Removes pre-7.3 Xcode versions from build matrix

### homebrew-iwyu v4.0.0 (June 16, 2016) ###

* Installs include-what-you-use 0.6 (based on clang 3.8.0)

* Compiles against Apple LLVM 7.3.0

* Adds Xcode 7.3 to Travis build matrix

### homebrew-iwyu v3.0.0 (December 23, 2015) ###

* Installs include-what-you-use 0.5 (based on clang 3.7.0)

* Drops support for Xcode 6; now requires 7.0 or higher

* Removes default OS X (Xcode 6.1) build from Travis

### homebrew-iwyu v2.1.0 (October 15, 2015) ###

* Supports Xcode 6.1 or higher, including 7.0

* Determines Xcode version at build time

* Adds support for C++ builtin headers

* No longer pollutes system include dirs

* Builds against multiple Xcode versions in Travis

* Adds stronger unit tests (fewer false positives)

### homebrew-iwyu v2.0.0 (June 28, 2015) ###

* Installs include-what-you-use 0.4

* Requires Xcode 6.1 or higher

* Compiles against LLVM 3.6

* Updates project page links

* Improves Travis CI build

### homebrew-iwyu v1.0.0 (December 6, 2014) ###

* Uses prebuilt tarball instead of compiling from source

* Symlinks to Xcode's clang headers rather than bringing in LLVM

* Requires Xcode 6.0 or higher

### homebrew-iwyu v0.9.0 (November 19, 2014) ###

* Initial release

* Builds `clang_3.5` tag from Subversion

* Compiles against LLVM 3.5
