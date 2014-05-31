class MindsetSerializer < ActiveModel::Serializer
  attribute :id
  has_one :emotion
end
