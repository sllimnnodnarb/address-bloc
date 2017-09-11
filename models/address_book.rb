require_relative 'entry'
require 'csv'
require 'bloc_record/base'

class AddressBook < BlocRecord::Base
  attr_accessor :entries
  def add_entry(name, phone, email)
    Entry.create(name: name, phone: phone, email: email)
  end

  def entries
    Entry.where(address_book_id: self.id)
  end

  def find_entry(name)
    Entry.where(name: name, address_book_id: self.id).first
  end

  def import_from_csv(file_name)
    csv_text = File.read(file_name)
    csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
    csv.each do |row|
      row_hash = row.to_hash
      add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
    end
  end

  # deletes the entry if name, phone and email match
  def remove_entry(name, phone, email)
    selected = nil
    @entries.each do |entry|
      if name == entry.name && phone_number == entry.phone_number && email == entry.email
        selected = entry
      end
    end
    @entries.delete(selected)
  end

  def delete_all
    @entries = []
  end

  def iterative_search(name)
    entries.each do |entry|
      if entry.name == name
        return entry
      end
    end
    return nil
  end

end
