# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_160_426_204_247) do
  create_table 'comments', force: :cascade do |t|
    t.integer  'link_id'
    t.text     'body'
    t.integer  'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_index 'comments', ['link_id'], name: 'index_comments_on_link_id'
  add_index 'comments', ['user_id'], name: 'index_comments_on_user_id'

  create_table 'links', force: :cascade do |t|
    t.string   'title'
    t.string   'url'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer  'user_id'
  end

  add_index 'links', ['user_id'], name: 'index_links_on_user_id'

  create_table 'users', force: :cascade do |t|
    t.string   'email',                  default: '', null: false
    t.string   'encrypted_password',     default: '', null: false
    t.string   'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer  'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string   'current_sign_in_ip'
    t.string   'last_sign_in_ip'
    t.datetime 'created_at',                          null: false
    t.datetime 'updated_at',                          null: false
    t.string   'name'
  end

  add_index 'users', ['email'], name: 'index_users_on_email', unique: true
  add_index 'users', ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true

  create_table 'votes', force: :cascade do |t|
    t.integer  'votable_id'
    t.string   'votable_type'
    t.integer  'voter_id'
    t.string   'voter_type'
    t.boolean  'vote_flag'
    t.string   'vote_scope'
    t.integer  'vote_weight'
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  add_index 'votes', %w[votable_id votable_type vote_scope],
            name: 'index_votes_on_votable_id_and_votable_type_and_vote_scope'
  add_index 'votes', %w[voter_id voter_type vote_scope],
            name: 'index_votes_on_voter_id_and_voter_type_and_vote_scope'
end
