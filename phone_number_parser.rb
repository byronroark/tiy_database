class PhoneNumberParser
  attr_reader :raw_phone_number

  def initialize(raw_phone_number)
    @raw_phone_number = raw_phone_number
  end

  def formatted
    if input.gsub(/\D/, "").match(/^1?(\d{3})(\d{3})(\d{4})/)
      [$1, $2, $3].join("-")
    end
  end
end
