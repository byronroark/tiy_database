
class UserManager
  attr_accessor :name,
                :phone_number,
                :address,
                :github_username,
                :slack_username

  def add_user
    puts "Enter New User's Name:"
    new_user = []
    @name = gets.chomp
    new_user << @name
    puts "Enter #{@name}'s Phone Number, starting with the Area Code:"
    input = gets.chomp
    extract_phone_number(input)
    @phone_number = input
    new_user << @phone_number
    puts "Enter #{@name}'s Address:"
    @address = gets.chomp
    new_user << @address
    puts "Enter #{@name}'s GitHub Username:"
    @github_username = gets.chomp
    new_user << @github_username
    puts "Enter #{@name}'s Slack Username:"
    @slack_username = gets.chomp
    new_user << @slack_username
    p new_user
  end

  def extract_phone_number(input)
    if input.gsub(/\D/, "").match(/^1?(\d{3})(\d{3})(\d{4})/)
      [$1, $2, $3].join("-")
    end
  end

  # def search_user
  # end
  #
  # def delete_user
  # end

  def request_action
    puts "Please select from the following actions:"
    puts "(A)dd User, (S)earch User, (D)elete User"
    action = gets.chomp.downcase
    if action == "a"
      puts "++ Add User ++"
      add_user
    elsif action == "s"
      puts "<< Search Users >>"
      search_user
    elsif action == "d"
      puts "-- Delete User --"
      delete_user
    else
      puts "That action is invalid! Please enter a valid action."
    end
  end
end

puts "<< Welcome to the Iron Yard User Database >>"
user_data = UserManager.new
user_data.request_action
