/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#pragma once

#include <functional>

#include "StateUpdate.h"

namespace facebook {
namespace react {

using StatePipe = std::function<void(StateUpdate const &stateUpdate)>;

} // namespace react
} // namespace facebook
