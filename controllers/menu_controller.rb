require_relative '../models/address_book'

class MenuController
  attr_reader :address_book

  def initialize
    @address_book = AddressBook.first
  end

  def main_menu
    puts "#{@address_book.name} Address Book - #{Entry.count} entries"
    puts "0 - Switch AddressBook"
    puts "1 - View all entries"
    puts "2 - View Entry Number n"
    puts "3 - Create an entry"
    puts "4 - Delete and Entry"
    puts "5 - Search for an entry"
    puts "6 - Import entries from a CSV"
    puts "7 - Exit"
    puts "8 - **ANNIHILATE ALL ENTRIES**"
    print "Enter your selection: "

    selection = gets.to_i
      case selection
      when 0
        system "clear"
        select_address_book_menu
        main_menu
      when 1
        system "clear"
         view_all_entries
        main_menu
      when 2
        system "clear"
        view_entry_number
        main_menu
      when 3
        system "clear"
        create_entry
        main_menu
      when 4
        system "clear"
        delete_entry
        main_menu
      when 5
        system "clear"
        search_entries
        main_menu
      when 6
        system "clear"
        read_csv
        main_menu
      when 7
        puts "Good-bye!"
        exit(0)
      when 8
        system "clear"
        @address_book.delete_all
        puts "ANNIHILATED ALL ENTRIES"
        main_menu
      else
        system "clear"
        puts "Sorry, that is not a valid input"
        main_menu
    end
  end

  def select_address_book_menu
    puts "Select an Address Book:"
    AddressBook.all.each_with_index do |address_book, index|
      puts "#{index} - #{@address_book.name}"
    end
    index = gets.chomp.to_i
    @address_book = AddressBook.find(index + 1)
    system "clear"
    return if @address_book
    puts "Please select a valid index"
    select_address_book_menu
  end

  def view_all_entries
    Entry.all.each do |entry|
      system "clear"
      puts entry.to_s
      entry_submenu(entry)
    end

    system "clear"
    puts "End of entries"
   end

  def view_entry_number
    system "clear"
    puts "What entry number do you want to search for?"
    n = (gets.chomp.to_i)
    if n < @address_book.entries.count && n > 0
      puts @address_book.entries[n]
      puts "Press enter to view main menu"
      gets.chomp
      system "clear"
    else
      puts "#{n} not found, try a lower number"
    end
  end

  def create_entry
    system "clear"
    puts "New AddressBloc Entry"
    print "Name: "
    name = gets.chomp
    print "Phone number: "
    phone = gets.chomp
    print "Email: "
    email = gets.chomp

    @address_book.add_entry(name, phone, email)

    system "clear"
    puts "New entry created"
  end

  def delete_entry(entry)
    entry.destroy
    puts "#{entry.name} has been deleted"
  end

  def edit_entry(entry)
    print "Updated name: "
    name = gets.chomp
    print "Updated phone number: "
    phone_number = gets.chomp
    print "Updated email: "
    email = gets.chomp
    entry.name = name if !name.empty?
    entry.phone_number = phone_number if !phone_number.empty?
    entry.email = email if !email.empty?
    system "clear"
    puts "Updated entry:"
    puts entry
  end

  def entry_submenu(entry)
    puts "n - next entry"
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"

    selection = gets.chomp

    case selection
      when "d"
        system "clear"
        delete_entry(entry)
        main_menu
      when "e"
        edit_entry(entry)
        system "clear"
        main_menu
      when "m"
        system "clear"
        main_menu
      else
        system "clear"
        puts "#{selection} is not a valid input"
        entry_submenu(entry)
    end
  end

  def search_entries
    print "Search by name: "
    name = gets.chomp
    match = Entry.find_by(:name, name)
    system "clear"
    if match
      puts match.to_s
      search_submenu(match)
    else
      puts "No match found for #{name}"
    end
  end

  def search_submenu(entry)
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"
    selection = gets.chomp

    case selection
      when "d"
        system "clear"
        delete_entry(entry)
        main_menu
      when "e"
        edit_entry(entry)
        system "clear"
        main_menu
      when "m"
        system "clear"
        main_menu
      else
        system "clear"
        puts "#{selection} is not a valid input"
        puts entry.to_s
        search_submenu(entry)
    end
  end

  def read_csv
  end
end
