
class Student < UserInfo
  attr_accessor :cohort,
                :graduated

  def show
    puts %{
      Name: #{name.capitalize}
      Role: #{self.class}
      Cohort: #{cohort}
      Graduated?: #{graduated}
      Phone: #{phone_number}
      Address: #{address}
      Github: #{github_account}
      Slack: #{slack_account}
    }
  end
end
