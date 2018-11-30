class LikeSerializer < ActiveModel::Serializer
  attributes :id, :interests, :five_fave_things, :personality_types, :gender_prefs, :searching_for
  has_one :user
end
