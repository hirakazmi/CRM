require_relative 'contact2'

class CRM

  def initialize
    main_menu
  end

  def main_menu

      while true
        print_main_menu
        user_selected = gets.to_i
        call_option(user_selected)
      end
  end

  def print_main_menu

    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number:'
  end

  def call_option(user_selected)

    case user_selected
      when 1 then add_new_contact
      when 2 then modify_existing_contact
      when 3 then delete_contact
      when 4 then display_all_contacts
      when 5 then search_by_attribute
      when 6 then exit_program
    end
  end

  def add_new_contact

    print 'Enter first name:'
    first_name = gets.chomp

    print 'Enter last name:'
    last_name = gets.chomp

    print 'Enter email address:'
    email = gets.chomp

    print 'Enter a note:'
    note = gets.chomp

  Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact

    puts 'what is the ID number of the contact you wish to modify?'
    id = gets.chomp
    puts Contact.find(id)

    puts 'Which attribute of the contact would you like to change from the following?'
    puts 'first_name'
    puts 'last_name'
    puts 'email'
    puts 'note'
    attribute = gets.chomp

    puts 'What would you like to change it to?'
    value = gets.chomp

    contact_to_change = Contact.find(id)
    contact_to_change.update(attribute, value)
  end

  def delete_contact

    puts 'What is the ID# of the contact you would like to delete?'
    id = gets.chomp.to_i

    contact_to_delete = Contact.find(id)
    contact_to_delete.delete
  end

  # # This method should accept as an argument an array of contacts
  # # and display each contact in that array
  def display_contacts(contacts)

    contacts.each do |display|
      puts "First name: #{display.first_name} Last name: #{display.last_name} Email: #{display.email} Note: #{display.note}"
    end
  end

  def display_all_contacts

    display_contacts(Contact.all)

  end

  def search_by_attribute
    puts 'What attribute do you wish to search by?'
    puts 'first_name'
    puts 'last_name'
    puts 'email'
    puts 'note'
    attribute = gets.chomp

    puts 'What is the value of the attribute you wish to search?'
    value = gets.chomp

display_contacts(Contact.find_by(attribute, value))
    # HINT: Make use of the display_contacts method to keep your code DRY
  end

  # Add other methods here, if you need them.

  def exit_program
    exit
  end

end

n = CRM.new
