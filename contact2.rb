class Contact

  attr_accessor :first_name, :last_name, :email, :note
  attr_reader :id

  @@contacts = []
  @@id = 1

  FIRSTNAME = "first_name"
  LASTNAME = "last_name"
  EMAIL = "email"
  NOTE = "note"

  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id += 1
  end

  def self.create(first_name, last_name, email, note)
    new_contact = self.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end

  def self.all
    return @@contacts
  end

  def self.find(id)
    found = @@contacts.select { |i| i.id == id }
    return found[0]
  end

  def update(attribute, value)
    case attribute
      when FIRSTNAME then @first_name = value
      when LASTNAME then @last_name = value
      when EMAIL then @email = value
      when NOTE then @note = value
    end
  end

  def self.find_by(attribute, value)

    found_contact = []

    case attribute
    when FIRSTNAME then
      @@contacts.select { |i| i.first_name == value }
    when LASTNAME then
      @@contacts.select { |i| i.last_name == value }
    when EMAIL then
      @@contacts.select  { |i| i.email == value }
    when NOTE then
      @@contacts.select { |i| i.note == value }
    end

    return found_contact[0]

  end

  def self.delete_all
    @@contacts.clear
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

  def delete
    @@contacts.delete(self)
  end

end

Contact.create("mina", "mikhail", "mina@bitmaker.co", "awesome")

Contact.create("betty", "name", "betty@something.co", "yay")

#
# p Contact.find(1)
# why = Contact.find_by("first_name", "betty")
# puts "why #{why[0].first_name}"
