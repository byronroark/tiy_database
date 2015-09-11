class Employee < UserInfo
  attr_accessor :salary,
                :position,
                :tenure

  attr_reader :date_hired

  def date_hired=(parsable_date)
    @date_hired = Date.parse(parsable_date)
  end

  def formatted_date_hired
    # Only this for caching performance reasons use ||=
    # Only in the case where we call formatted_date_hired for
    # the *SAME* employee many times
    @formatted_date_hired ||= date_hired.strftime('%m-%d-%Y')
  end

  def tenure
    @tenure = ((Date.today - date_hired).to_f/365).round
  end

  def show
    puts %{
      Name: #{name.capitalize}
      Role: #{self.class}
      Position: #{position}
      Salary: #{salary}
      Phone: #{phone_number}
      Address: #{address}
      Github: #{github_account}
      Slack: #{slack_account}
    }
  end
end
