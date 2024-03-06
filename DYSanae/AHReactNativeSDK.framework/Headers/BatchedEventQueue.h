/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#pragma once

#include "EventQueue.h"
#include "EventQueueProcessor.h"

namespace facebook {
namespace react {

/*
 * Event Queue that dispatches event in batches synchronizing them with
 * an Event Beat.
 */
class BatchedEventQueue final : public EventQueue {
 public:
  BatchedEventQueue(
      EventQueueProcessor eventProcessor,
      std::unique_ptr<EventBeat> eventBeat);

  void onEnqueue() const override;
};

} // namespace react
} // namespace facebook
