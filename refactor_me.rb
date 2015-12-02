require 'test/unit'

tol = Struct.new('TimeOfLife', :label, :min_age, :max_age)

TIME_OF_LIFES = [
  tol.new('baby', 0, 2),
  tol.new('little child', 3, 6),
  tol.new('child', 7, 12),
  tol.new('youth', 13, 18),
  tol.new('adult', 19, Float::INFINITY)
]

def age_to_label(age)
  tol = TIME_OF_LIFES.find {|t| (t.min_age..t.max_age) === age }

  tol ? tol.label : raise
end

class MyTest < Test::Unit::TestCase
  def test_negative_age
    assert_raise do
      age_to_label(-1)
    end
  end

  def test_baby_min
    assert_equal('baby', age_to_label(0))
  end

  def test_baby_max
    assert_equal('baby', age_to_label(2))
  end

  def test_little_child_min
    assert_equal('little child', age_to_label(3))
  end

  def test_little_child_max
    assert_equal('little child', age_to_label(6))
  end

  def test_child_min
    assert_equal('child', age_to_label(7))
  end

  def test_child_max
    assert_equal('child', age_to_label(12))
  end

  def test_youth_min
    assert_equal('youth', age_to_label(13))
  end

  def test_youth_max
    assert_equal('youth', age_to_label(18))
  end

  def test_adult
    assert_equal('adult', age_to_label(19))
  end

  def test_immortality
    assert_equal('adult', age_to_label(200))
  end

  def test_float
    assert_equal('baby', age_to_label(0.1))
  end
end
