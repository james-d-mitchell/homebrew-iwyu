require "English"
require "formula"

# include-what-you-use needs access to headers included with LLVM 3.6, which
# is only present in Xcode version 6.1 or higher.
class Xcode61 < Requirement
  fatal true

  satisfy { MacOS::Xcode.version >= "6.1" }

  def message
    "Xcode 6.1 or newer is required for this package."
  end
end

# This formula provides an easy way to install include-what-you-use, a tool for
# automatically managing include directives within C and C++ projects. It will
# build and install include-what-you-use, symlink it as iwyu, and install a
# Python wrapper to automatically correct includes (fix_include).
class Iwyu < Formula
  CLANG_VERSION = "3.5" # technically a lie

  homepage "https://code.google.com/p/include-what-you-use/"
  url "http://include-what-you-use.com/downloads/" \
    "include-what-you-use-#{Iwyu::CLANG_VERSION}-macosx-apple-darwin.tar.gz"
  sha1 "7f38d22c3da1c9924179b522a9f4299373cddcd8"
  version "0.3"

  depends_on Xcode61

  def install
    clang_libs = "#{MacOS::Xcode.toolchain_path}/usr/lib/clang/6.1.0"
    iwyu_clang_path = (lib / "clang")

    iwyu_clang_path.mkpath
    iwyu_clang_path.install_symlink(clang_libs => "#{Iwyu::CLANG_VERSION}.0")

    bin.install("fix_includes.py" => "fix_include")
    bin.install("include-what-you-use")
    bin.install_symlink("include-what-you-use" => "iwyu")
  end

  test do
    # write out a header and a C file relying on transitive dependencies
    (testpath / "demo.h").write("#include <stdio.h>")
    (testpath / "demo.c").write <<-EOS.undent
    #include "demo.h"

    int main(void)
    { printf("hello world"); }
    EOS

    # iwyu always exits with status 1 so assert that and capture output
    fixes = shell_output "iwyu #{testpath}/demo.c 2>&1", 1

    # pass the output to the fixer script and assert that it fixed one file
    results = pipe_output "fix_include", fixes

    assert_match(/IWYU edited 1 file/, results)

    # sigh. they use the status code to signal how many files were edited
    assert_equal 1, $CHILD_STATUS.exitstatus
  end
end
