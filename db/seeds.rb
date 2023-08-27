# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

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
specialty_one = Specialty.create(name: "Gynecologist", doctor: doctor_two)
specialty_two = Specialty.create(name: "Surgeon", doctor: doctor_one)
specialty_three = Specialty.create(name: "Cardiologist", doctor: doctor_three)
specialty_fourth = Specialty.create(name: "Gastroenterologist", doctor: doctor_fifth)
specialty_fifth = Specialty.create(name: "Oncologist", doctor: doctor_fourth)
specialty_sixth = Specialty.create(name: "Pediatrician", doctor: doctor_sixth)

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
