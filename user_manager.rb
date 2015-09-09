
class UserManager
  attr_accessor :name,
                :phone_number,
                :address,
                :github_account,
                :slack_account

  def add_user
    puts ""
    puts "Enter New User's Name:"
    users = []
    @name = gets.chomp.capitalize
    puts "You entered: #{@name}."
    users << @name
    p users
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
      puts "++ Add New User ++"
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
