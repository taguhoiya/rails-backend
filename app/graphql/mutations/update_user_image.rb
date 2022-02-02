# frozen_string_literal: true

module Mutations
  class UpdateUserImage < BaseMutation
    field :user, Types::UserType, null: true

    argument :id, ID, required: true
    argument :nickname, String, required: false
    argument :self_intro, String, required: false
    argument :image, ApolloUploadServer::Upload, required: false
    def resolve(**args)
      user = User.find(args[:id])
      image = args[:image]
      self_intro = args[:self_intro]
      nickname = args[:nickname]
      user.file.attach(io: image.to_io, filename: image.original_filename) unless image.nil?
      user.update!(image: image, nickname: nickname, self_intro: self_intro)
      {
        user: user
      }
    end
  end
end
