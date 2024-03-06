/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#pragma once

#ifdef ANDROID

#include "MapBuffer.h"
#include "MapBufferBuilder.h"

namespace facebook {
namespace react {

constexpr MapBuffer::Key PROPS_MAX = 1;
constexpr MapBuffer::Key PROPS_NATIVE_ID = 1;

} // namespace react
} // namespace facebook

#endif
