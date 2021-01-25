require 'minitest/reporters'
# require "stringio"
Minitest::Reporters.use!
require 'minitest/autorun'

class FizzBuzzTest < Minitest::Test
  describe 'FizzBuzz' do
    def setup
      @fizzbuzz = FizzBuzz
    end

    describe '三の倍数の場合' do
      def test_3を渡したら文字列Fizzを返す
        assert_equal 'Fizz', @fizzbuzz.generate(3)
      end
    end

    describe '五の倍数の場合' do
      def test_5を渡したら文字列Buzzを返す
        assert_equal 'Buzz', @fizzbuzz.generate(5)
      end
    end

    describe '三と五の倍数の場合' do
      def test_15を渡したら文字列FizzBuzzを返す
        # require 'byebug'
        # byebug
        assert_equal 'FizzBuzz', @fizzbuzz.generate(15)
      end
    end

    describe 'その他の場合' do
      def test_1を渡したら文字列1を返す
        assert_equal '1', @fizzbuzz.generate(1)
      end
    end
    describe '1から100までのFizzBuzzの配列を返す' do
      def setup
        @result = FizzBuzz.generate_list
      end

      def test_配列の初めは文字列の1を返す
        # require 'byebug'
        # byebug
        # result = ['1', '2', '3']
        # assert_equal '1', result.first
        # assert_equal '2', result[1]
        # assert_equal '3', result.last
        # result = FizzBuzz.print_1_to_100
        assert_equal '1', @result.first
      end

      # def test_配列の最後は文字列の100を返す
      def test_配列の最後は文字列のBuzzを返す
        # result = FizzBuzz.print_1_to_100
        assert_equal 'Buzz', @result.last
      end

      def test_配列の2番目は文字列のFizzを返す
        # result = FizzBuzz.print_1_to_100
        assert_equal 'Fizz', @result[2]
      end

      def test_配列の4番目は文字列のBuzzを返す
        # result = FizzBuzz.print_1_to_100
        assert_equal 'Buzz', @result[4]
      end

      def test_配列の14番目は文字列のFizzBuzzを返す
        # result = FizzBuzz.print_1_to_100
        assert_equal 'FizzBuzz', @result[14]
      end
    end
  end

  describe '配列や繰り返し処理を理解する' do
    def test_繰り返し処理
      $stdout = StringIO.new
      [1, 2, 3].each { |i| p i * i }
      output = $stdout.string

      assert_equal "1\n" + "4\n" + "9\n", output
    end

    def test_特定の条件を満たす要素だけを配列に入れて返す
      result = [1.1, 2, 3.3, 4].select(&:integer?)
      assert_equal [2, 4], result
    end

    def test_特定の条件を満たさない要素だけを配列に入れて返す
      result = [1.1, 2, 3.3, 4].reject(&:integer?)
      assert_equal [1.1, 3.3], result
    end

    def test_新しい要素の配列を返す
      result = %w[apple orange pineapple strawberry].map(&:size)
      assert_equal [5, 6, 9, 10], result
    end

    def test_新しい要素の配列を返す
      result = %w[apple orange pineapple strawberry].map(&:size)
      assert_equal [5, 6, 9, 10], result
    end

    def test_配列の中から条件に一致する要素を取得する
      result = %w[apple orange pineapple strawberry].find(&:size)
      assert_equal 'apple', result
    end

    def test_配列の中から条件に一致する要素を取得する
      result = %w[apple orange pineapple strawberry].detect(&:size)
      assert_equal 'apple', result
    end

    def test_指定した評価式で並び替えた配列を返す
      assert_equal %w[1 10 13 2 3 4], %w[2 4 13 3 1 10].sort
      assert_equal %w[1 2 3 4 10 13], %w[2 4 13 3 1 10].sort { |a, b| a.to_i <=> b.to_i }
      assert_equal %w[13 10 4 3 2 1], %w[2 4 13 3 1 10].sort { |b, a| a.to_i <=> b.to_i }
    end

    def test_配列の中から条件に一致する要素を取得する
      result = %w[apple orange pineapple strawberry apricot].grep(/^a/)
      assert_equal %w[apple apricot], result
    end

    def test_ブロック内の条件式が真である間までの要素を返す
      result = [1, 2, 3, 4, 5, 6, 7, 8, 9].take_while { |item| item < 6 }
      assert_equal [1, 2, 3, 4, 5], result
    end

    def test_ブロック内の条件式が真である以降の要素を返す
      result = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].drop_while { |item| item < 6 }
      assert_equal [6, 7, 8, 9, 10], result
    end

    def test_畳み込み演算を行う
      result = [1, 2, 3, 4, 5].inject(0) { |total, n| total + n }
      assert_equal 15, result
    end

    def test_畳み込み演算を行う
      result = [1, 2, 3, 4, 5].reduce { |total, n| total + n }
      assert_equal 15, result
    end
  end
end

class FizzBuzz
  MAX_NUMBER = 100
  def self.generate(number)
    # result = number.to_s

    # if number.modulo(3).zero? && number.modulo(5).zero?
    #   result = 'FizzBuzz'
    # elsif number.modulo(3).zero?
    #   result = 'Fizz'
    # elsif number.modulo(5).zero?
    #   result = 'Buzz'
    # end
    is_fizz = number.modulo(3).zero?
    is_buzz = number.modulo(5).zero?

    return 'FizzBuzz' if is_fizz && is_buzz
    return 'Fizz' if is_fizz
    return 'Buzz' if is_buzz

    number.to_s
  end

  # def self.print_1_to_100
  def self.generate_list
    # ['1', '2', '3']
    # %w[1 2 3]
    # result = []
    # (1..100).each { |n|
    # result << n.to_s
    #   result << generate(n)
    # }

    # 1から最大値までのFizzBuzz配列を一発で作る
    (1..MAX_NUMBER).map { |n| generate(n) }
  end
end
