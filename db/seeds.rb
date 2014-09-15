Department.create(name: 'Marketing')              unless Department.find_by(name: 'Marketing')
Department.create(name: 'Information Technology') unless Department.find_by(name: 'Information Technology')
Department.create(name: 'Sales')                  unless Department.find_by(name: 'Sales')
Department.create(name: 'Human Resources')        unless Department.find_by(name: 'Human Resources')
Department.create(name: 'Finance')                unless Department.find_by(name: 'Finance')
Department.create(name: 'Events')                 unless Department.find_by(name: 'Events')
Department.create(name: 'Other')                  unless Department.find_by(name: 'Other')

unless User.find_by(email: 'claire@example.com')
  User.create(name: 'claire',
              email: 'claire@example.com',
              password: 'password',
              password_confirmation: 'password'
             )
end

unless User.find_by(email: 'david@example.com')
  User.create(name: 'david',
              email: 'david@example.com',
              password: 'staff-password',
              password_confirmation: 'staff-password'
             )
end

State.create(name: 'Waiting for Staff Response') unless State.find_by(name: 'Waiting for Staff Response')
