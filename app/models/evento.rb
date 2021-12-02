class Evento < ApplicationRecord
	validates :name, presence: true
end
