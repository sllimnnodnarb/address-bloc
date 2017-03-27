require_relative 'entry'

class AddressBook
    attr_reader :entries

    def initialize
      @entries = []
    end

  def add_entry(name, phone_number, email)
    index = 0
    @entries.each do |entry|
      if name < entry.name
        break
      end
      index += 1
    end
    @entries.insert(index, Entry.new(name, phone_number, email))
  end

  def remove_entry(name, phone_number, email)
<<<<<<< HEAD
    selected = nil
=======
    var selected = nil
>>>>>>> address-bloc-models
    @entries.each do |entry|
      if name == entry.name && phone_number == entry.phone_number && email == entry.email
        selected = entry
      end
      @entries.delete(selected)
    end
  end
end
