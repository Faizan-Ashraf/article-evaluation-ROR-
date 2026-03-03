class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, { admin: 'admin', competitor: 'competitor' }

  has_many :created_competitions, class_name: 'Competition', foreign_key: 'created_by_id', dependent: :nullify
  has_many :submissions, foreign_key: 'competitor_id', dependent: :destroy
end