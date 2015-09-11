class Employee < UserInfo
  attr_accessor :salary,
                :position

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
end
