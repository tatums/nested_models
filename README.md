## Cuba, ActiveRecord, and Active Model


## Webserver

```bash
$ rackup
```


## Console

```bash
$ rake console
```



## Active::Record
```ruby
class User < ActiveRecord::Base
  validates :first, :last, presence: true
end
```

```ruby
class Org < ActiveRecord::Base
  validates :name, presence: true
end
```

## Active::Model

Let the Active::Record models validate themselves and raise up any errors on the encapsolating ActiveModel model.

```ruby
class Signup
  include ActiveModel::Model
  attr_accessor :first, :last, :name

  validates_each :user, :org do |record, attr, value|
    unless value.valid?
      value.errors.each { |k,v| record.errors.add(k.to_sym, v) }
    end
  end

  ## must return boolean
  def save
    if valid?
      org.save && user.save
    else
      false
    end
  end

  private

    def org
      @org || Org.new(name: name)
    end

    def user
      @user || User.new(first: first, last: last)
    end
end
```




```ruby
[1] pry(main)> s = Signup.new(first: "John")
=> #<Signup:0x007f8bec60d4f0 @first="John">
[2] pry(main)> s.valid?
=> false
[3] pry(main)> s.errors
=> #<ActiveModel::Errors:0x007f8bec1f75f0
 @base=#<Signup:0x007f8bec60d4f0 @errors=#<ActiveModel::Errors:0x007f8bec1f75f0 ...>, @first="John", @validation_context=nil>,
 @messages={:last=>["can't be blank"], :name=>["can't be blank"]}>
[4] pry(main)> s.last = "Doe"
=> "Doe"
[5] pry(main)> s.name = "Hashie Corp"
=> "Hashie Corp"
[6] pry(main)> s.valid?
=> true
[7] pry(main)> s.save
=> true
[10] pry(main)>
```
