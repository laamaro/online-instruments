require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @psychologist = users(:psychologist)
    @patient = users(:patient)
  end

  test "respective numbers should return right role" do
    user_test1 = User.new(email: 'teste@teste.com', role: 0)
    user_test2 = User.new(email: 'teste@testando.com', role: 1)

    assert_equal "psychologist", user_test1.role, "role 0 should return psychologist"
    assert_equal "patient", user_test2.role, "role 0 should return patient"
  end

  test "psychologist should be valid without registration number or birth_date" do
    assert @psychologist.valid?
  end

  test "patient should not be valid without registration number or birth_date" do
    patient1 = User.new(email: 'patient@test.com', password: '123123',
                        role: 1, first_name: 'Patient', last_name: 'NoDate', registration_number: '02134577809')

    patient2 = User.new(email: 'patient2@test.com', password: '123123',
                        role: 1, first_name: 'Patient', last_name: 'NoNumber', birth_date: '1978-06-25')

    patient_valid = User.new(email: 'patient2@test.com', password: '123123', role: 1, first_name: 'Patient',
                             last_name: 'NoNumber', birth_date: '1978-06-25', registration_number: '02134577810')

    assert_not patient1.valid?
    assert_not patient2.valid?
    assert patient_valid.valid?
  end
end
