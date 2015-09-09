
class User
  attr_accessor :first_name,
                :last_name,
                :phone_number,
                :address,
                :github_account,
                :slack_account

end

def request_action
  actions = { "a" => "add", "s" => "search", "d" => "delete" }
  valid_choices = actions.keys
  loop do
    puts "Please select from the following actions:"
    puts "(A)dd User, (S)earch User, (D)elete User"
    action = gets.chomp.downcase
    return actions[action] if actions.key?(action)
      puts "That action is invalid! Please enter a valid action."
  end
end

puts "<< Welcome to the Iron Yard User Database >>"
request_action
