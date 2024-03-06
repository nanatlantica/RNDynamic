/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#pragma once

#include <functional>
#include <string>

#include "jsi.h"
#include "EventTarget.h"
#include "ReactEventPriority.h"
#include "ValueFactory.h"

namespace facebook {
namespace react {

using EventPipe = std::function<void(
    jsi::Runtime &runtime,
    const EventTarget *eventTarget,
    const std::string &type,
    ReactEventPriority priority,
    const ValueFactory &payloadFactory)>;

} // namespace react
} // namespace facebook
