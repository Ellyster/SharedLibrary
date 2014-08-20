require 'bcrypt'

class User < ActiveRecord::Base
  include Gravtastic
  gravtastic

  has_many :reviews, dependent: :destroy

  validates :name,
            presence: true

  validates :username,
            presence: true,
            uniqueness: true

  validates :email,
            presence: true,
            uniqueness: true,
            format: {with: /@/}

  validates :encrypted_password,
            presence: true

  validates :salt,
            presence: true

  #validates :librarian,
            #presence: true

  #validates :admin,
            #presence: true

end
