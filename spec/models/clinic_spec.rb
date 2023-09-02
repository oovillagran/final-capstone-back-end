require 'rails_helper'

RSpec.describe Clinic, type: :model do
  before(:each) do
    @user = User.create(
      first_name: 'Eric',
      last_name: 'Antwi',
      birthdate: Date.parse('30-09-2001'),
      phone_number: '+233206546917',
      username: 'Mylo16',
      email: 'ericopokuantwi384@gmail.com',
      password: '123456'
    )
    @doctor = Doctor.create(name: 'Eric Antwi', photo: 'myprofile.png', bio: 'I am a dentist', experience_years: '3',
                            user_id: @user.id)
    @clinic = Clinic.create(name: 'Ridge Hospital', city: 'Accra', address: '29th street, Madina',
                            doctor_id: @doctor.id)
  end

  describe 'Clinic validations' do
    it 'has valid attributes' do
      expect(@clinic).to be_valid
    end

    it 'is not valid without a name' do
      @clinic.name = nil
      expect(@clinic).to_not be_valid
    end
  end
end
