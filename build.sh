#!/bin/bash
native_path="/home/sanchuan/Documents/electron/src/ohos_sdk/openharmony/native"
export CC="$native_path/llvm/bin/clang"
export CXX="$native_path/llvm/bin/clang++"
export LD="$native_path/llvm/bin/lld"
export STRIP="$native_path/llvm/bin/llvm-strip"
export RANLIB="$native_path/llvm/bin/llvm-ranlib"
export OBJDUMP="$native_path/llvm/bin/llvm-objdump"
export AR="$native_path/llvm/bin/llvm-ar"
export NM="$native_path/llvm/bin/llvm-nm"
export OBJCOPY="$native_path/llvm/bin/llvm-objcopy"


# 配置交叉编译到 ARM64/AArch64
export CFLAGS="-fPIC -D__MUSL__=1 --target=aarch64-linux-ohos --sysroot=$native_path/sysroot -I$native_path/sysroot/usr/include -I$native_path/sysroot/usr/include/aarch64-linux-ohos"
export CXXFLAGS="-fPIC -D__MUSL__=1 --target=aarch64-linux-ohos --sysroot=$native_path/sysroot -I$native_path/sysroot/usr/include -I$native_path/sysroot/usr/include/aarch64-linux-ohos -I$native_path/llvm/include/c++/v1 -D_LIBCPP_PROVIDES_DEFAULT_RUNE_TABLE -D_LIBCPP_HAS_MUSL_LIBC -D_LIBCPP_HAS_NO_VENDOR_AVAILABILITY_ANNOTATIONS"
export LDFLAGS="--target=aarch64-linux-ohos --sysroot=$native_path/sysroot -stdlib=libc++ -L$native_path/sysroot/usr/lib/aarch64-linux-ohos -L$native_path/llvm/lib -Wl,--gc-sections -Wl,-z,relro -Wl,-z,now"
export SYSROOT="$native_path/sysroot"

# 清理之前的构建
rm -rf build node_modules

npm install --verbose --build-from-source --runtime=electron --target=20.18.1 --dist-url=https://electronjs.org/headers

# npm install --verbose --build-from-source --runtime=electron --target=20.18.1 --dist-url=https://electronjs.org/headers