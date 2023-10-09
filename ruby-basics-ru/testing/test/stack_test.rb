# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def setup
    @stack = Stack.new
  end

  def before_teardown
    @stack.clear!
  end

  def test_should_add
    @stack.push! 'value'
    assert_includes(@stack.to_a, 'value')
  end

  def test_should_pop
    @stack.push! 'value'
    assert_includes(@stack.to_a, 'value')
    @stack.pop!
    assert_predicate @stack.to_a, :empty?
  end

  def test_should_clear
    @stack.push! 'value'
    assert_includes(@stack.to_a, 'value')
    @stack.clear!
    assert_predicate @stack.to_a, :empty?
  end

  def test_empty_method_should_work
    assert @stack.empty? == true
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
