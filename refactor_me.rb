require 'test/unit'

def age_to_label(age)
  0 <= age or raise

  if 0 <= age && age <= 2
    'baby'
  elsif 3 <= age && age <= 6
    'little child'
  elsif 7 <= age && age <= 12
    'child'
  elsif 13 <= age && age <= 18
    'youth'
  else
    'adult'
  end
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
