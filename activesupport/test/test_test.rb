require File.dirname(__FILE__) + '/abstract_unit'

class AssertDifferenceTest < Test::Unit::TestCase
  
  def setup
    @object = Class.new do
      attr_accessor :num 
      def increment
        self.num += 1
      end

      def decrement
        self.num -= 1
      end
    end.new    
    @object.num = 0
  end
  
  def test_assert_no_difference
    assert_no_difference '@object.num' do
      # ...
    end
  end

  def test_assert_difference
    assert_difference '@object.num', +1 do
      @object.increment
    end
  end

  def test_assert_difference_with_implicit_difference
    assert_difference '@object.num' do
      @object.increment
    end
  end

  def test_arbitrary_expression
    assert_difference '@object.num + 1', +2 do
      @object.increment
      @object.increment
    end
  end

  def test_negative_differences
    assert_difference '@object.num', -1 do
      @object.decrement
    end
  end
end
