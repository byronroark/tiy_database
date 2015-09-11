require 'date'

require_relative 'userinfo'
require_relative 'student'
require_relative 'phone_number_parser'
require_relative 'employee'

class Database
  def initialize
    byron = Student.new
    byron.name = "byron"
    byron.cohort = "Fall 2015"
    byron.graduated = "no"
    byron.phone_number = "352-281-7726"
    byron.address = "410 S Armenia Ave"
    byron.github_account = "byronroark"
    byron.slack_account = "byronroark"

    sanam = Student.new
    sanam.name = "sanam"

    gavin = Employee.new
    gavin.name = "gavin"

    jason = Employee.new
    jason.name = "jason"

    @users = [byron, sanam, gavin, jason]
    # @users = []
  end

  def find_user_by_name(name)
    @users.find { |user| user.name.include?(name) }
  end

  def search_user(name)
    user = find_user_by_name(name)
    if user.is_a?(Student)
      puts "Name: #{user.name.capitalize}\nRole: #{Student}\nCohort: #{user.cohort}\nGraduated?: #{user.graduated}\nPhone: #{user.phone_number}\nAddress: #{user.address}\nGithub: #{user.github_account}\nSlack: #{user.slack_account}"
      puts "---"
    elsif user.is_a?(Employee)
      puts "Name: #{user.name.capitalize}\nRole: #{Employee}\nPosition: #{user.position}\nSalary: #{user.salary}\nPhone: #{user.phone_number}\nAddress: #{user.address}\nGithub: #{user.github_account}\nSlack: #{user.slack_account}"
      puts "---"
    else
      puts "No match found for #{name}."
    end
  end

  def delete_user(name)
    user = find_user_by_name(name)
    if user
      puts "!!! REMOVED #{user.name.capitalize} from the Database !!!"
      @users.delete(user)
    else
      puts "#{name} not found."
    end
  end

  def prompt(message)
    puts message
    gets.chomp.downcase
  end

  def get_student_info(name)
    user = Student.new
    user.name = name
    user.cohort = prompt("Enter #{user.name.capitalize}'s Cohort:")
    puts "#{user.name.capitalize}'s belongs to TIY #{user.cohort} Cohort."
    puts "---"
    graduated = prompt("Has #{user.name.capitalize} Graduated yet? (Y)es or (N)o.").downcase
    if graduated == "y"
      user.graduated = "yes"
    elsif graduated == "n"
      user.graduated = "pending"
    else
      puts "Invalid choice. Please enter (y)es or (n)o"
    end
    puts "#{user.name.capitalize}'s graduation status added."
    puts "---"
    raw_number = prompt("Enter #{user.name.capitalize}'s Phone Number, starting with Area Code:")
    user.phone_number = PhoneNumberParser.formatted(raw_number)
    puts "#{user.name.capitalize}'s phone number is #{user.phone_number}."
    puts "---"
    user.address = prompt("Enter #{user.name.capitalize}'s Address:")
    puts "#{user.name.capitalize}'s address is #{user.address}."
    puts "---"
    user.github_account = prompt("Enter #{user.name.capitalize}'s GitHub Username:")
    puts "#{user.name.capitalize}'s GitHub Username is #{user.github_account}."
    puts "---"
    user.slack_account = prompt("Enter #{user.name.capitalize}'s Slack Username:")
    puts "#{user.name.capitalize}'s Slack Username is #{user.slack_account}."
    puts "---"
    puts "<<< SAVING #{user.name.capitalize}'s Profile to the Database >>>"
    return user
  end

  def get_employee_info(name)
    user = Employee.new
    user.name = name
    position = prompt("Select #{user.name.capitalize}'s Position at Iron Yard:\n(D)irector, (R)ails Instructor, or (F)ront-end Instructor").downcase
    if position == "d"
      user.position = "Director"
    elsif position == "r"
      user.position = "Rails Instructor"
    elsif position == "f"
      user.position = "Front-end Instructor"
    else
      puts "Invalid selection. Please select one of the valid options."
    end
    puts "#{user.name.capitalize} is the #{user.position} of Iron Yard Tampa."
    puts "---"
    user.salary = prompt("Enter #{user.name.capitalize}'s Salary:")
    puts "#{user.name.capitalize}'s Salary is: #{user.salary}."
    puts "---"
    user.date_hired = prompt("Enter the Date that #{user.name.capitalize} was hired (MM-DD-YYYY):")
    puts "#{user.name.capitalize} was hired on #{user.date_hired}."
    puts "---"
    raw_number = prompt("Enter #{user.name.capitalize}'s Phone Number, starting with Area Code:")
    user.phone_number = PhoneNumberParser.formatted(raw_number)
    puts "#{user.name.capitalize}'s phone number is #{user.phone_number}."
    puts "---"
    user.address = prompt("Enter #{user.name.capitalize}'s Address:")
    puts "#{user.name.capitalize}'s address is #{user.address}."
    puts "---"
    user.github_account = prompt("Enter #{user.name.capitalize}'s GitHub Username:")
    puts "#{user.name.capitalize}'s GitHub Username is #{user.github_account}."
    puts "---"
    user.slack_account = prompt("Enter #{user.name.capitalize}'s Slack Username:")
    puts "#{user.name.capitalize}'s Slack Username is #{user.slack_account}."
    puts "---"
    puts "<<< SAVING #{user.name.capitalize}'s Profile to the Database >>>"
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
end

database = Database.new
puts "Welcome to the Iron Yard User Database!"

loop do
  puts "Select from the following actions:"
  action = database.prompt("(A)dd User, (S)earch User, (D)elete User, (Q)uit.").downcase
  if action == "a"
    puts "+++ ADD USER +++"
    name = database.prompt("Enter New User's Name:").downcase
    if database.find(name)
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
