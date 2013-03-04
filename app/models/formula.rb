class Formula
  include Mongoid::Document
  field :name
  field :expression

  belongs_to :user
end
