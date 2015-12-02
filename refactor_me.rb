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
  def test_0
    assert_equal('', age_to_label(0))
  end
end
