class UserInfo
  attr_accessor :name,
                :role,
                :phone_number,
                :address,
                :github_account,
                :slack_account
end

class Student < UserInfo
  attr_accessor :cohort,
                :graduated
end

class Employee < UserInfo
  attr_accessor :salary,
                :position,
                :date_hired
end

class UserManager
  def initialize(name)
    @user_name = name
  end

  def add_user
    puts "Adding New (S)tudent or (E)mployee User?"
    role = gets.chomp.downcase
    if role == "s"
      user = Student.new
      user.name = @user_name
      user.role = "Student"
      puts "---"
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
      extracted_number = extract_phone_number(raw_number)
      user.phone_number = extracted_number
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
      user.role = "Employee"
      puts "Enter New Employee's Name:"
      user.name = gets.chomp
      puts "#{user.name} added."
      puts "---"
      puts "Enter #{user.name}'s Salary:"
      user.salary = gets.chomp
      puts "#{user.name}'s Salary is: #{user.salary}."
      puts "---"
      puts "Enter the Year #{user.name} was hired:"
      user.date_hired = gets.chomp
      puts "#{user.name} was hired in #{user.date_hired}"
      puts "---"
      puts "Enter #{user.name}'s Phone Number, starting with Area Code:"
      raw_number = gets.chomp
      extracted_number = extract_phone_number(raw_number)
      user.phone_number = extracted_number
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
    else
      puts "That action is invalid! Please enter a valid action."
    end
    p users.inspect
  end
end

def extract_phone_number(input)
  if input.gsub(/\D/, "").match(/^1?(\d{3})(\d{3})(\d{4})/)
    [$1, $2, $3].join("-")
  end
end

# def search_user
# end
#
def delete_user
  puts "Enter User to be Removed:"
  user_marked_for_death = gets.chomp
  users.each do |user|
    if user_marked_for_death == user.name
      puts "!!! REMOVING #{user.name} from the Database !!!"
      users -= [user]
    else
      puts "#{user.name} not found."
    end
  end
end

puts "Welcome to the Iron Yard User Database!"
puts "Select from the following actions:"
puts "(A)dd User, (S)earch User, (D)elete User, (Q)uit."
action = gets.chomp.downcase
if action == "a"
  puts "+++ ADD USER +++"
  users = Array.new
  puts "Enter New User's Name:"
  name = gets.chomp
  puts "#{name} added."
  new_user = UserManager.new(name)
  new_user.add_user
elsif action == "s"
  puts ">>> SEARCH USERS <<<"
  search_user
elsif action == "d"
  puts "--- DELETE USER ---"
  delete_user
elsif action == "q"
  puts "~~~ EXITING ~~~"
  exit
else
  puts "That action is invalid! Please enter a valid action."
end
