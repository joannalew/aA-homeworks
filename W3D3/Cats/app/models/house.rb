class House < ApplicationRecord
	has_many :cats,
		primary_key: :id,
		foreign_key: :house_id,
		class_name: :Cat

	has_many :toys,
		through: :cats,  #name of association in this class
		source: :toys
end