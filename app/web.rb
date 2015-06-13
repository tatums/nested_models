Cuba.use Rack::Session::Cookie, :secret => "__a_very_long_string__"


Cuba.define do
  on get do
    on "hello" do
      res.write "Hello world!"
    end

    on root do
      res.redirect "/hello"
    end
  end
end
