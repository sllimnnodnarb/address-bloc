require_relative '../models/address_book'
require_relative '../models/entry'
require 'bloc_record'

BlocRecord.connect_to('db/address_bloc.sqlite')

book = AddressBook.create(name: 'My Address Book')

puts 'Address Book created'
puts 'Entry created'
puts Entry.create(address_book_id: book.id, name: 'Foo One', phone_number: '999-999-9999', email: 'foo_one@gmail.com' )
puts Entry.create(address_book_id: book.id, name: 'Foo Two', phone_number: '111-111-1111', email: 'foo_two@gmail.com' )
puts Entry.create(address_book_id: book.id, name: 'Foo Three', phone_number: '222-222-2222', email: 'foo_three@gmail.com' )
puts 'Seeds sown.'
puts 'The sower went out to sow his seed; and as he sowed, some fell beside the road, and it was trampled under foot and the birds of the air ate it up. Other seed fell on rocky soil, and as soon as it grew up, it withered away, because it had no moisture. Other seed fell among the thorns; and the thorns grew up with it and choked it out. Other seed fell into the good soil, and grew up, and produced a crop a hundred times as great.'
