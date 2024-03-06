/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#pragma once

#include <vector>

#include "jsi.h"
#include "EventPipe.h"
#include "RawEvent.h"
#include "StatePipe.h"
#include "StateUpdate.h"

namespace facebook {
namespace react {

class EventQueueProcessor {
 public:
  EventQueueProcessor(EventPipe eventPipe, StatePipe statePipe);

  void flushEvents(jsi::Runtime &runtime, std::vector<RawEvent> &&events) const;
  void flushStateUpdates(std::vector<StateUpdate> &&states) const;

 private:
  EventPipe const eventPipe_;
  StatePipe const statePipe_;

  mutable bool hasContinuousEventStarted_{false};
};

} // namespace react
} // namespace facebook
