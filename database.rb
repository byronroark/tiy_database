require 'date'

require_relative 'userinfo'
require_relative 'student'
require_relative 'phone_number_parser'
require_relative 'employee'

class Database
  def initialize
    @users = []
  end

  def search_user(name)
    @users.each do |user|
      if users.name == name
        puts "Found User #{users.name}"
        if users.role == "Student"
          # print out their attributes
        elsif users.role == "Employee"
          # print out their attributes
        end
        return
      end
    end

    puts "#{name} not found."
  end

  def delete_user(name)
    users.each do |user|
      if user == user.name
        puts "!!! REMOVING #{user.name} from the Database !!!"
        users -= [user]
      else
        puts "#{user.name} not found."
      end
    end
  end

  def add_user(name)
    puts "Adding New (S)tudent or (E)mployee User?"
    role = gets.chomp.downcase
    if role == "s"
      user = Student.new
      user.name = name
      puts "Enter #{user.name}'s Cohort:"
      user.cohort = gets.chomp
      puts "#{user.name}'s belongs to TIY #{user.cohort} Cohort."
      puts "---"
      puts "Has #{user.name} Graduated? (Y)es or (N)ot yet"
      graduated = gets.chomp.downcase
      if graduated == "y"
        user.graduated = "yes"
      elsif graduated == "n"
        user.graduated = "no"
      else
        puts "Invalid choice. Please enter (y)es or (n)o"
      end
      puts "#{user.name}'s graduation status added."
      puts "---"
      puts "Enter #{user.name}'s Phone Number, starting with Area Code:"
      raw_number = gets.chomp
      user.phone_number = PhoneNumberParser.new(raw_number).formatted
      puts "#{user.name}'s phone number is #{user.phone_number}."
      puts "---"
      puts "Enter #{user.name}'s Address:"
      user.address = gets.chomp
      puts "#{user.name}'s address is #{user.address}."
      puts "---"
      puts "Enter #{user.name}'s GitHub Username:"
      user.github_account = gets.chomp
      puts "#{user.name}'s GitHub Username is #{user.github_account}."
      puts "---"
      puts "Enter #{user.name}'s Slack Username:"
      user.slack_account = gets.chomp
      puts "#{user.name}'s Slack Username is #{user.slack_account}."
      puts "---"
      puts "<<< SAVING #{user.name}'s Profile to the Database >>>"
      users << user
    elsif role == "e"
      user = Employee.new
      user.name = name
      puts "Enter #{user.name}'s Salary:"
      user.salary = gets.chomp
      puts "#{user.name}'s Salary is: #{user.salary}."
      puts "---"
      puts "Enter the Date #{user.name} was hired (MM-DD-YYYY):"
      user.date_hired = gets.chomp
      puts "#{user.name} was hired on #{user.date_hired}"
      puts "---"
      puts "Enter #{user.name}'s Phone Number, starting with Area Code:"
      raw_number = gets.chomp
      user.phone_number = PhoneNumberParser.new(raw_number).formatted
      puts "#{user.name}'s phone number is #{user.phone_number}."
      puts "---"
      puts "Enter #{user.name}'s Address:"
      user.address = gets.chomp
      puts "#{user.name}'s address is #{user.address}."
      puts "---"
      puts "Enter #{user.name}'s GitHub Username:"
      user.github_account = gets.chomp
      puts "#{user.name}'s GitHub Username is #{user.github_account}."
      puts "---"
      puts "Enter #{user.name}'s Slack Username:"
      user.slack_account = gets.chomp
      puts "#{user.name}'s Slack Username is #{user.slack_account}."
      puts "---"
      puts "<<< SAVING #{user.name}'s Profile to the Database >>>"
      @users << user
    else
      puts "That action is invalid! Please enter a valid action."
    end
    p @users
  end
end

database = Database.new
puts "Welcome to the Iron Yard User Database!"

# some kind of loop starting here
puts "Select from the following actions:"
puts "(A)dd User, (S)earch User, (D)elete User, (Q)uit."
action = gets.chomp.downcase
if action == "a"
  puts "+++ ADD USER +++"
  puts "Enter New User's Name:"
  name = gets.chomp.capitalize
  database.add_user(name)
  puts "#{name} added."
elsif action == "s"
  puts ">>> SEARCH USERS <<<"
  name = gets.chomp
  puts "Searching for #{name}..."
  user.search_user(name)
elsif action == "d"
  puts "--- DELETE USER ---"
  puts "Enter User's Name you want REMOVED from Database:"
  name = gets.chomp
  user.delete_user(name)
elsif action == "q"
  puts "~~~ EXITING ~~~"
  exit
else
  puts "That action is invalid! Please enter a valid action."
end
# loop ends here
