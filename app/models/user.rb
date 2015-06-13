class User < ActiveRecord::Base
  validates :first, :last, presence: true
end
