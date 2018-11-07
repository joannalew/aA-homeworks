class Cat < ApplicationRecord
	belongs_to :house, 
		primary_key: :id,
		foreign_key: :house_id,
		class_name: :House

	has_many :toys,
		primary_key: :id,
		foreign_key: :cat_id,
		class_name: :Toy
end

