class Ganre < ApplicationRecord
   has_many :ganres, dependent: :destroy
end
