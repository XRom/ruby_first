class Session
  extend ActiveModel::Naming

  attr_accessor :id, :email, :password

  def to_model
    self
  end

  def to_key 
    id 
  end

  def persisted? 
    false 
  end
end