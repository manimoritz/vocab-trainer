require 'test_helper'

class VerbTest < ActiveSupport::TestCase
  test 'conjugation list' do
    amare = verbs(:amare)
    assert_equal 'amõ', amare.conjugation_list[0][:text]
    assert_equal 'amãs', amare.conjugation_list[1][:text]
    assert_equal 'amat', amare.conjugation_list[2][:text]
    assert_equal 'amãmus', amare.conjugation_list[3][:text]
    assert_equal 'amãtis', amare.conjugation_list[4][:text]
    assert_equal 'amant', amare.conjugation_list[5][:text]
  end
end
