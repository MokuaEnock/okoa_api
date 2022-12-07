class OrderSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :weight, :wastetype, :instructions, :date

  belongs_to :user
end
