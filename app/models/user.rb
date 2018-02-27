class User < ApplicationRecord
  self.table_name = "MOCK_DATA"
  self.primary_key = :id
  validates_presence_of :email, :first_name, :last_name, :username
  validates_uniqueness_of :email, :username
end
