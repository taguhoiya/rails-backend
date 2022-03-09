# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_220_309_064_150) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness',
                                                    unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.string 'service_name', null: false
    t.bigint 'byte_size', null: false
    t.string 'checksum', null: false
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'active_storage_variant_records', force: :cascade do |t|
    t.bigint 'blob_id', null: false
    t.string 'variation_digest', null: false
    t.index %w[blob_id variation_digest], name: 'index_active_storage_variant_records_uniqueness', unique: true
  end

  create_table 'clips', force: :cascade do |t|
    t.bigint 'movie_id', null: false
    t.bigint 'user_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['movie_id'], name: 'index_clips_on_movie_id'
    t.index ['user_id'], name: 'index_clips_on_user_id'
  end

  create_table 'comments', force: :cascade do |t|
    t.text 'content', null: false
    t.bigint 'user_id', null: false
    t.bigint 'mark_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['mark_id'], name: 'index_comments_on_mark_id'
    t.index ['user_id'], name: 'index_comments_on_user_id'
  end

  create_table 'favorites', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'mark_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['mark_id'], name: 'index_favorites_on_mark_id'
    t.index ['user_id'], name: 'index_favorites_on_user_id'
  end

  create_table 'mark_drafts', force: :cascade do |t|
    t.float 'score', default: 0.0, null: false
    t.text 'content'
    t.bigint 'movie_id', null: false
    t.bigint 'user_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['movie_id'], name: 'index_mark_drafts_on_movie_id'
    t.index ['user_id'], name: 'index_mark_drafts_on_user_id'
  end

  create_table 'marks', force: :cascade do |t|
    t.float 'score', default: 0.0, null: false
    t.text 'content'
    t.bigint 'movie_id', null: false
    t.bigint 'user_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['movie_id'], name: 'index_marks_on_movie_id'
    t.index ['user_id'], name: 'index_marks_on_user_id'
  end

  create_table 'movie_categories', force: :cascade do |t|
    t.bigint 'movie_id', null: false
    t.boolean 'action', default: false, null: false
    t.boolean 'adventure', default: false, null: false
    t.boolean 'animation', default: false, null: false
    t.boolean 'comedy', default: false, null: false
    t.boolean 'crime', default: false, null: false
    t.boolean 'documentary', default: false, null: false
    t.boolean 'drama', default: false, null: false
    t.boolean 'family', default: false, null: false
    t.boolean 'fantasy', default: false, null: false
    t.boolean 'history', default: false, null: false
    t.boolean 'horror', default: false, null: false
    t.boolean 'music', default: false, null: false
    t.boolean 'mystery', default: false, null: false
    t.boolean 'romance', default: false, null: false
    t.boolean 'science_fiction', default: false, null: false
    t.boolean 'tv_movie', default: false, null: false
    t.boolean 'thriller', default: false, null: false
    t.boolean 'war', default: false, null: false
    t.boolean 'western', default: false, null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['movie_id'], name: 'index_movie_categories_on_movie_id'
  end

  create_table 'movies', force: :cascade do |t|
    t.string 'movie_name', null: false
    t.string 'poster_path'
    t.text 'summary'
    t.integer 'runtime', default: 0, null: false
    t.string 'release_year'
    t.string 'release_date'
    t.string 'country'
    t.string 'category'
    t.string 'release_state', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'tmdb_id'
    t.string 'homepage'
  end

  create_table 'notifications', force: :cascade do |t|
    t.integer 'visitor_id', null: false
    t.integer 'visited_id', null: false
    t.integer 'mark_id'
    t.integer 'comment_id'
    t.string 'action', default: '', null: false
    t.boolean 'checked', default: false, null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['comment_id'], name: 'index_notifications_on_comment_id'
    t.index ['mark_id'], name: 'index_notifications_on_mark_id'
    t.index ['visited_id'], name: 'index_notifications_on_visited_id'
    t.index ['visitor_id'], name: 'index_notifications_on_visitor_id'
  end

  create_table 'relationships', force: :cascade do |t|
    t.integer 'follower_id'
    t.integer 'followed_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['followed_id'], name: 'index_relationships_on_followed_id'
    t.index %w[follower_id followed_id], name: 'index_relationships_on_follower_id_and_followed_id', unique: true
    t.index ['follower_id'], name: 'index_relationships_on_follower_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'provider', default: 'email', null: false
    t.string 'uid', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.boolean 'allow_password_change', default: false
    t.datetime 'remember_created_at'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.string 'unconfirmed_email'
    t.string 'name'
    t.string 'nickname'
    t.string 'image'
    t.string 'email'
    t.text 'self_intro'
    t.json 'tokens'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['confirmation_token'], name: 'index_users_on_confirmation_token', unique: true
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
    t.index %w[uid provider], name: 'index_users_on_uid_and_provider', unique: true
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'active_storage_variant_records', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'clips', 'movies'
  add_foreign_key 'clips', 'users'
  add_foreign_key 'comments', 'marks'
  add_foreign_key 'comments', 'users'
  add_foreign_key 'favorites', 'marks'
  add_foreign_key 'favorites', 'users'
  add_foreign_key 'mark_drafts', 'movies'
  add_foreign_key 'mark_drafts', 'users'
  add_foreign_key 'marks', 'movies'
  add_foreign_key 'marks', 'users'
  add_foreign_key 'movie_categories', 'movies'
end
