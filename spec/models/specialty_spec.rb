require 'rails_helper'

RSpec.describe Specialty, type: :model do
  before(:each) do
    @user = User.create(
      first_name: 'Eric',
      last_name: 'Antwi',
      birthdate: Date.parse('30-09-2001'),
      role: 'user',
      phone_number: '+233206546917',
      username: 'Mylo16',
      email: 'ericopokuantwi384@gmail.com',
      password: '123456'
    )
    @doctor = Doctor.create(name: 'Eric Antwi', photo: 'myprofile.png', bio: 'I am a dentist', experience_years: '3',
                            user_id: @user.id)
    @specialty = Specialty.create(specialty_type: 'Dentistry', doctor_id: @doctor.id)
  end

  describe 'Specialty validations' do
    it 'has valid attributes' do
      expect(@specialty).to be_valid
    end
  end
end
