#!/bin/bash
OHOS_NATIVE_PATH="/home/sanchuan/Documents/electron/src/ohos_sdk/openharmony/native"
export CC="$OHOS_NATIVE_PATH/llvm/bin/clang"
export CXX="$OHOS_NATIVE_PATH/llvm/bin/clang++"
export LD="$OHOS_NATIVE_PATH/llvm/bin/lld"
export STRIP="$OHOS_NATIVE_PATH/llvm/bin/llvm-strip"
export RANLIB="$OHOS_NATIVE_PATH/llvm/bin/llvm-ranlib"
export OBJDUMP="$OHOS_NATIVE_PATH/llvm/bin/llvm-objdump"
export AR="$OHOS_NATIVE_PATH/llvm/bin/llvm-ar"
export NM="$OHOS_NATIVE_PATH/llvm/bin/llvm-nm"
export OBJCOPY="$OHOS_NATIVE_PATH/llvm/bin/llvm-objcopy"


# 配置交叉编译到 ARM64/AArch64
export CFLAGS="-fPIC -D__MUSL__=1 --target=aarch64-linux-ohos --sysroot=$OHOS_NATIVE_PATH/sysroot -I$OHOS_NATIVE_PATH/sysroot/usr/include -I$OHOS_NATIVE_PATH/sysroot/usr/include/aarch64-linux-ohos"
export CXXFLAGS="-fPIC -D__MUSL__=1 --target=aarch64-linux-ohos --sysroot=$OHOS_NATIVE_PATH/sysroot -I$OHOS_NATIVE_PATH/sysroot/usr/include -I$OHOS_NATIVE_PATH/sysroot/usr/include/aarch64-linux-ohos -I$OHOS_NATIVE_PATH/llvm/include/c++/v1 -D_LIBCPP_PROVIDES_DEFAULT_RUNE_TABLE -D_LIBCPP_HAS_MUSL_LIBC -D_LIBCPP_HAS_NO_VENDOR_AVAILABILITY_ANNOTATIONS"
export LDFLAGS="--target=aarch64-linux-ohos --sysroot=$OHOS_NATIVE_PATH/sysroot -stdlib=libc++ -L$OHOS_NATIVE_PATH/sysroot/usr/lib/aarch64-linux-ohos -L$OHOS_NATIVE_PATH/llvm/lib -Wl,--gc-sections -Wl,-z,relro -Wl,-z,now"
export SYSROOT="$OHOS_NATIVE_PATH/sysroot"

# 清理之前的构建
rm -rf build node_modules

npm install --verbose --build-from-source --runtime=electron --target=20.18.1 --dist-url=https://electronjs.org/headers