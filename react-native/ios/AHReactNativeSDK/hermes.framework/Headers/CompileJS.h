/*
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#ifndef HERMES_COMPILEJS_H
#define HERMES_COMPILEJS_H

#include <string>

namespace hermes {

/// Compiles JS source \p str and if compilation is successful, returns true
/// and outputs to \p bytecode otherwise returns false.
/// \param sourceURL this will be used as the "file name" of the buffer for
///   errors, stack traces, etc.
/// NOTE: Doesn't throw any exceptions. It's up to the caller to report failure.
///
/// TODO(30388684): Return opaque object that can be run or serialized.
__attribute__((visibility("default"))) bool compileJS(
    const std::string &str,
    const std::string &sourceURL,
    std::string &bytecode,
    bool optimize = true);

__attribute__((visibility("default"))) bool compileJS(
    const std::string &str,
    std::string &bytecode,
    bool optimize = true);

/// 编译 JavaScript 文件为 Hermes 字节码的自定义函数
/// @param jsPath 要编译的 javaScript 文件路径
/// @param outPath 生成的 Hermes 字节码的路径
/// @return int 返回码：0-成功
__attribute__((visibility("default"))) int customCompileJS(
    const std::string &jsPath,
    const std::string &outPath
    );

} // namespace hermes

#endif
