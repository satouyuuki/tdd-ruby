require 'minitest/reporters'
# require "stringio"
Minitest::Reporters.use!
require 'minitest/autorun'

class HelloTest < Minitest::Test
  def test_numToString
    assert_equal '1', numToString(1)
    assert_equal 'Fizz', numToString(3)
    assert_equal 'Buzz', numToString(5)
    assert_equal 'FizzBuzz', numToString(15)
  end

  def test_createOneHundred
    assert_equal [1..100], createOneHundred
  end

  def test_stringToPrint
    assert_output('hoge') { stringToPrint('hoge') }
  end

  def test_result
    assert_equal 'hogehoge', result
  end

  def numToString(num)
    if num % 15 == 0
      'FizzBuzz'
    elsif num % 3 == 0
      'Fizz'
    elsif num % 5 == 0
      'Buzz'
    else
      num.to_s
    end
  end

  def createOneHundred
    [1..100]
  end

  def stringToPrint(str)
    print str
  end

  def result
    array = createOneHundred
    array.each do |n|
      result = numToString(n)
      stringToPrint(result)
    end
  end
end
