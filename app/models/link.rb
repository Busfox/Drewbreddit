# frozen_string_literal: true

class Link < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  has_many :comments
end
