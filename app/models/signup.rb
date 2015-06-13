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
