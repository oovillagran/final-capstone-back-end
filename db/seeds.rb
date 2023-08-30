# Create an admin user
admin = User.create!(
  first_name: "Admin",
  last_name: "User",
  username: "admin",
  email: "admin@example.com",
  password: "password",
  role: "admin",
  phone_number: "1234567890", # Replace with an appropriate phone number
  birthdate: Date.parse("1990-01-01") # Replace with a valid birthdate
)

# Create a doctor user
doctor = User.create!(
  first_name: "Doctor",
  last_name: "User",
  username: "doctor",
  email: "doctor@example.com",
  password: "password",
  role: "doctor",
  phone_number: "9876543210", # Replace with an appropriate phone number
  birthdate: Date.parse("1985-05-15") # Replace with a valid birthdate
)

# Create a common user
common_user = User.create!(
  first_name: "Common",
  last_name: "User",
  username: "user",
  email: "user@example.com",
  password: "password",
  role: "user",
  phone_number: "5555555555", # Replace with an appropriate phone number
  birthdate: Date.parse("1995-09-10") # Replace with a valid birthdate
)

# Create doctors
doctor_profile = Doctor.create!(
  name: "Dr. John Doe",
  photo: "https://plus.unsplash.com/premium_photo-1661764878654-3d0fc2eefcca?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80",
  bio: "Experienced doctor with specialization in cardiology.",
  experience_years: "10",
  user: doctor
)

# Create clinics
clinic = Clinic.create!(
  name: "Heart Clinic",
  city: "New York",
  address: "123 Main St",
  doctor: doctor_profile
)

# Create specialties
specialty = Specialty.create!(
  name: "Cardiology",
  doctor: doctor_profile
)

# Create reservations
reservation = Reservation.create!(
  reservation_date: Date.today,
  reservation_time: Time.now,
  status: true,
  user: common_user,
  doctor: doctor_profile,
  clinic: clinic
)

puts "Seeds have been successfully created."

# Create Users
user_one = User.create(first_name: "Mark", last_name: "Anthony", phone_number: "+1 203 456", birthdate: "12-05-1975", role: "admin", username: "manthony", email: "manthony@test.com", password: "123456")
user_two = User.create(first_name: "Jennifer", last_name: "Lawrence", phone_number: "+1 354 123", birthdate: "02-08-1989", role: "user", username: "jlawrence", email: "jlawrence@test.com", password: "123456")
user_three = User.create(first_name: "Brandon", last_name: "Cooper", phone_number: "+1 012 345", birthdate: "07-02-1983", role: "user", username: "bcooper", email: "bcooper@test.com", password: "123456")

# Create Doctors
doctor_one = Doctor.create(name: "Philip Morris", photo: "https://images.pexels.com/photos/5452291/pexels-photo-5452291.jpeg?auto=compress&cs=tinysrgb&w=600", bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.", user: user_one, experience_years: "15")
doctor_two = Doctor.create(name: "Myriam Duzak", photo: "https://media.istockphoto.com/id/1189304032/photo/doctor-holding-digital-tablet-at-meeting-room.jpg?b=1&s=612x612&w=0&k=20&c=oDCtU9LmtmKYeNfzNEWCPR-Wwhe998euSNBEZFNEdxs=", bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.", user: user_one, experience_years: "5")
doctor_three = Doctor.create(name: "Mel Gibson", photo: "https://images.pexels.com/photos/5452268/pexels-photo-5452268.jpeg?auto=compress&cs=tinysrgb&w=600", bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.", user: user_one, experience_years: "7")
doctor_fourth = Doctor.create(name: "Zara Tzech", photo: "https://images.pexels.com/photos/6749778/pexels-photo-6749778.jpeg?auto=compress&cs=tinysrgb&w=600", bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.", user: user_one, experience_years: "2")
doctor_fifth = Doctor.create(name: "Dibon Ubuntu", photo: "https://images.pexels.com/photos/4989168/pexels-photo-4989168.jpeg?auto=compress&cs=tinysrgb&w=600", bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.", user: user_one, experience_years: "4")
doctor_sixth = Doctor.create(name: "Diane Cardinal", photo: "https://images.pexels.com/photos/3714743/pexels-photo-3714743.jpeg?auto=compress&cs=tinysrgb&w=600", bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.", user: user_one, experience_years: "6")

# Create Specialties
specialty_one = Specialty.create(name: "Gynecology", doctor: doctor_two)
specialty_two = Specialty.create(name: "Surgery", doctor: doctor_one)
specialty_three = Specialty.create(name: "Cardiology", doctor: doctor_three)
specialty_fourth = Specialty.create(name: "Gastroenterology", doctor: doctor_fifth)
specialty_fifth = Specialty.create(name: "Oncology", doctor: doctor_fourth)
specialty_sixth = Specialty.create(name: "Pediatrics", doctor: doctor_sixth)

# Create Clinics
clinic_one = Clinic.create(name: "Cardiology Clinics", city: "Oslo", address: "Av. Ocean 432", doctor: doctor_three )
clinic_two = Clinic.create(name: "Woman Clinics", city: "Bergen", address: "Av. southern 289", doctor: doctor_two)
clinic_three = Clinic.create(name: "Surgical Clinics", city: "Stavanger", address: "Av. Guzank 394", doctor: doctor_one)
clinic_fourth = Clinic.create(name: "Cardiology Clinics", city: "Oslo", address: "Av. southern 289", doctor: doctor_fifth)
clinic_fifth = Clinic.create(name: "Woman Clinics", city: "Bergen", address: "Av. Guzank 394", doctor: doctor_fourth)
clinic_sixth = Clinic.create(name: "Surgical Clinics", city: "Stavanger", address: "Av. Guzank 394", doctor: doctor_sixth)

# Create Reservations
reservation_one = Reservation.create( reservation_date: '15-10-2023', reservation_time: '10:45', status: true, user: user_two, doctor: doctor_three, clinic: clinic_one)
reservation_two = Reservation.create( reservation_date: '25-09-2023', reservation_time: '14:35', status: true, user: user_three, doctor: doctor_two, clinic: clinic_two)
reservation_three = Reservation.create( reservation_date: '05-11-2023', reservation_time: '09:32', status: true, user: user_two, doctor: doctor_one, clinic: clinic_three)
