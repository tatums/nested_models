class User < ActiveRecord::Base
  validates :first, :last, presence: true
end

class Org < ActiveRecord::Base
  validates :name, presence: true
end

class Signup
  include ActiveModel::Model
  attr_accessor :first, :last

  validates :first, presence: true
end




Cuba.use Rack::Session::Cookie, :secret => "__a_very_long_string__"


Cuba.define do
  on get do
    on "hello" do

      binding.pry

      res.write "Hello world!"
    end

    on root do
      res.redirect "/hello"
    end
  end
end
