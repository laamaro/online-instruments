require "test_helper"

class AppliedInstrumentTest < ActiveSupport::TestCase
  setup do
    @applied_instrument = applied_instruments(:one)
    @patient = users(:patient)
    @instrument = instruments(:one)
  end

  test "should not have the same instrument for user" do
    applies_intrument_test = AppliedInstrument.new(user: @patient, instrument: @instrument, status: 0)

    assert_not applies_intrument_test.valid?
  end
end
