class User < ApplicationRecord
  self.table_name = "MOCK_DATA"
  self.primary_key = :id
end
