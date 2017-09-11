require 'bloc_record/base'

class Entry < BlocRecord::Base
  
  def to_s
    "Name: #{name}\n
    Phone Number: #{phone_number}\n
    Email: #{email}"
  end
end
