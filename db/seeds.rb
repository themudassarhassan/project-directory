# Create test user
user = User.create!(email: 'test.user@example.com', name: 'John Doe', password: 'helloworld123')

# Create sample projects

Project.create!(name: 'Notifications System', description: 'The aim of this project is to send system notifications.', user:)
Project.create!(name: 'Expense Management System', description: 'Manages expenses of individual persons.', user:)
Project.create!(name: 'Tic Tac Toe', description: 'A two person game.', user:)
