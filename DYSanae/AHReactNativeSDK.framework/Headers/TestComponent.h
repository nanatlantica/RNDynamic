/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#pragma once

#include <memory>

#include <folly/dynamic.h>
#include "ConcreteViewShadowNode.h"
#include "ViewEventEmitter.h"
#include "ViewProps.h"
#include "ConcreteComponentDescriptor.h"
#include "PropsParserContext.h"
#include "RawProps.h"
#include "ShadowNode.h"

/**
 * This defines a set of TestComponent classes: Props, ShadowNode,
 * ComponentDescriptor. To be used for testing purpose.
 */

namespace facebook::react {

class TestState {
 public:
  int number;
};

static const char TestComponentName[] = "Test";

class TestProps : public ViewProps {
 public:
  TestProps() = default;

  TestProps(
      const PropsParserContext &context,
      const TestProps &sourceProps,
      const RawProps &rawProps)
      : ViewProps(context, sourceProps, rawProps) {}
};

using SharedTestProps = std::shared_ptr<const TestProps>;

class TestShadowNode;

using SharedTestShadowNode = std::shared_ptr<const TestShadowNode>;

class TestShadowNode final : public ConcreteViewShadowNode<
                                 TestComponentName,
                                 TestProps,
                                 ViewEventEmitter,
                                 TestState> {
 public:
  using ConcreteViewShadowNode::ConcreteViewShadowNode;

  Transform _transform{Transform::Identity()};

  Transform getTransform() const override {
    return _transform;
  }

  facebook::react::Point _contentOriginOffset{};

  facebook::react::Point getContentOriginOffset() const override {
    return _contentOriginOffset;
  }
};

class TestComponentDescriptor
    : public ConcreteComponentDescriptor<TestShadowNode> {
 public:
  using ConcreteComponentDescriptor::ConcreteComponentDescriptor;
};

} // namespace facebook::react
