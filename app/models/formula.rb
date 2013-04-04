class Formula
  include Mongoid::Document
  
  field :name
  field :expression

  belongs_to :user

  validates_presence_of :name
  validates_presence_of :expression
end
