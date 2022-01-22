# frozen_string_literal: true

module Mutations
  class UpdateUserImage < BaseMutation
    field :user, Types::UserType, null: true

    argument :id, ID, required: true
    argument :nickname, String, required: false
    argument :image, ApolloUploadServer::Upload, required: false
    def resolve(**args)
      user = User.find(args[:id])
      if args[:image] && args[:nickname]
        image = args[:image]
        user.file.attach(io: image.to_io, filename: image.original_filename)
        user.update!(image: args[:image], nickname: args[:nickname])
      elsif args[:image].nil?
        user.update!(nickname: args[:nickname])
      elsif args[:nickname].nil?
        image = args[:image]
        user.file.attach(io: image.to_io, filename: image.original_filename)
        user.update!(image: args[:image], nickname: args[:nickname])
        user.update!(image: args[:image])
      end
      {
        user: user
      }
    end
  end
end
