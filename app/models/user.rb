class User < ApplicationRecord
  validates_presence_of :email, :first_name, :last_name, :username
  validates_uniqueness_of :email, :username
end
