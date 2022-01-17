# frozen_string_literal: true

module Mutations
  class UpdateUserImage < BaseMutation
    field :user, Types::UserType, null: true

    argument :id, ID, required: true
    argument :image, ApolloUploadServer::Upload, required: false
    def resolve(**args)
      user = User.find(args[:id])
      image = args[:image]
      user.file.attach(io: image.to_io, filename: image.original_filename)
      user.update!(image: args[:image])
      {
        user: user
      }
    end
  end
end
