Department.create(name: 'Marketing')
Department.create(name: 'Information Technology')
Department.create(name: 'Sales')
Department.create(name: 'Human Resources')
Department.create(name: 'Finance')
Department.create(name: 'Events')
Department.create(name: 'Other')

User.create(name: 'claire',
            email: 'claire@example.com',
            password: 'password',
            password_confirmation: 'password'
           )

User.create(name: 'david',
            email: 'david@example.com',
            password: 'staff-password',
            password_confirmation: 'staff-password'
           )
