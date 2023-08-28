# Create an admin user
admin = User.create!(
  first_name: "Admin",
  last_name: "User",
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
  email: "user@example.com",
  password: "password",
  role: "user",
  phone_number: "5555555555", # Replace with an appropriate phone number
  birthdate: Date.parse("1995-09-10") # Replace with a valid birthdate
)

# Create doctors
doctor_profile = Doctor.create!(
  name: "Dr. John Doe",
  photo: "doctor.jpg",
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
  specialty_type: "Cardiology",
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
