# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :User_Name, :Location, :About, :Gender_Identity, :Preferred_Pronoun
end
