class User < ActiveRecord::Base

  # run inline callback before save
  before_save { self.email = email.downcase if email.present? }

  before_save { self.name = self.name.split.map!{|a| a.capitalize}.join(' ') if self.name }
    # or
  # before_save :format_name
  # def format_name
  #   name = name.split(' ')
  #   name.each { |a| a.capitalize!  }
  #   name.join('')
  # end


  # ensure name is present and follows min/max
  validates :name, length: { minimum: 1, maximum: 100, }, presence: true
  # when creting a new user, they have a password
  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  # when updating user password - allow changing of other attr and not changing pw
  validates :password, length: { minimum: 6 }, allow_blank: true
  # email present, unique, case sensative min/max and formatted
  validates :email,
            presence: true,
            uniqueness: { case_sensative: false },
            length: { minimum: 3, maximum: 254 }
  # ruby function add methods to set and authenticate against bcrypt password
  has_secure_password

end
