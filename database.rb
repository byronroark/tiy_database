require 'date'

require_relative 'userinfo'
require_relative 'student'
require_relative 'phone_number_parser'
require_relative 'employee'

class Database
  def initialize
    toni = Student.new
    toni.name = "Toni"

    gavin = Employee.new
    gavin.name = "Gavin"

    jason = Employee.new
    jason.name = "Jason"

    @users = [toni, gavin, jason]
  end

  def search_user(name)
    user = @users.find { |user| user.name.include?(name) }
    if user
      puts ">>> #{user.name} found! <<<"
    else
      puts "No match found for #{name}."
    end
  end

  def delete_user(name)
    user = @users.find { |user| user.name.include?(name) }
    # @users.delete_if { |user| user.name == name }
    if user
      puts "!!! REMOVED #{user.name} from the Database !!!"
      @users.delete(user)
    else
      puts "#{name} not found."
    end
  end

  def prompt(message)
    puts message
    gets.chomp
  end

  def get_student_info(name)
    user = Student.new
    user.name = name
    user.cohort = prompt("Enter #{user.name}'s Cohort:")
    puts "#{user.name}'s belongs to TIY #{user.cohort} Cohort."
    puts "---"
    graduated = prompt("Has #{user.name} Graduated? (Y)es or (N)ot yet").downcase
    if graduated == "y"
      user.graduated = "yes"
    elsif graduated == "n"
      user.graduated = "no"
    else
      puts "Invalid choice. Please enter (y)es or (n)o"
    end
    puts "#{user.name}'s graduation status added."
    puts "---"
    raw_number = prompt("Enter #{user.name}'s Phone Number, starting with Area Code:")
    user.phone_number = PhoneNumberParser.formatted(raw_number)
    puts "#{user.name}'s phone number is #{user.phone_number}."
    puts "---"
    user.address = prompt("Enter #{user.name}'s Address:")
    puts "#{user.name}'s address is #{user.address}."
    puts "---"
    user.github_account = prompt("Enter #{user.name}'s GitHub Username:")
    puts "#{user.name}'s GitHub Username is #{user.github_account}."
    puts "---"
    user.slack_account = prompt("Enter #{user.name}'s Slack Username:")
    puts "#{user.name}'s Slack Username is #{user.slack_account}."
    puts "---"
    puts "<<< SAVING #{user.name}'s Profile to the Database >>>"
    return user
  end

  def get_employee_info(name)
    user = Employee.new
    user.name = name
    user.salary = prompt("Enter #{user.name}'s Salary:")
    puts "#{user.name}'s Salary is: #{user.salary}."
    puts "---"
    user.date_hired = prompt("Enter the Date #{user.name} was hired (MM-DD-YYYY):")
    puts "#{user.name} was hired on #{user.date_hired}"
    puts "---"
    raw_number = prompt("Enter #{user.name}'s Phone Number, starting with Area Code:")
    user.phone_number = PhoneNumberParser.formatted(raw_number)
    puts "#{user.name}'s phone number is #{user.phone_number}."
    puts "---"
    user.address = prompt("Enter #{user.name}'s Address:")
    puts "#{user.name}'s address is #{user.address}."
    puts "---"
    user.github_account = prompt("Enter #{user.name}'s GitHub Username:")
    puts "#{user.name}'s GitHub Username is #{user.github_account}."
    puts "---"
    user.slack_account = prompt("Enter #{user.name}'s Slack Username:")
    puts "#{user.name}'s Slack Username is #{user.slack_account}."
    puts "---"
    puts "<<< SAVING #{user.name}'s Profile to the Database >>>"
    return user
  end

  def add_user(name)
    role = prompt("Adding New (S)tudent or (E)mployee User?").downcase
    if role == "s"
      @users << get_student_info(name)
    elsif role == "e"
      @users << get_employee_info(name)
    else
      puts "That action is invalid! Please enter a valid action."
    end
    p @users
  end

  def has_name_already?(name)
    @users.find { |user| user.name.include?(name)}
  end
end

database = Database.new
puts "Welcome to the Iron Yard User Database!"

loop do
  puts "Select from the following actions:"
  action = database.prompt("(A)dd User, (S)earch User, (D)elete User, (Q)uit.").downcase
  if action == "a"
    puts "+++ ADD USER +++"
    name = database.prompt("Enter New User's Name:").capitalize
    if database.has_name_already?(name)
      puts "User already exists!"
    else
      database.add_user(name)
      puts "#{name} added to the Database."
    end
  elsif action == "s"
    puts ">>> SEARCH USERS <<<"
    name = database.prompt("Enter the User's Name you want to SEARCH from Database:")
    puts "Searching for #{name}..."
    database.search_user(name)
  elsif action == "d"
    puts "--- DELETE USER ---"
    name = database.prompt("Enter the User's Name you want REMOVED from Database:")
    database.delete_user(name)
  elsif action == "q"
    puts "~~~ EXITING ~~~"
    exit
  else
    puts "That action is invalid! Please enter a valid action."
  end
end
