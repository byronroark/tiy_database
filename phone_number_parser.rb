class PhoneNumberParser
  def self.formatted(raw_phone_number)
    if raw_phone_number.gsub(/\D/, "").match(/^1?(\d{3})(\d{3})(\d{4})/)
      [$1, $2, $3].join("-")
    end
  end
end
