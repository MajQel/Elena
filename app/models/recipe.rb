class Recipe < ApplicationRecord
	has_many :directions, inverse_of: :recipe
	has_many :recipe_ingredients
	has_many :ingredients, through: :recipe_ingredients

	accepts_nested_attributes_for :ingredients,
									reject_if: proc { |attributes| attributes['name'].blank? },
									allow_destroy: true
	accepts_nested_attributes_for :directions,
									reject_if: proc { |attributes| attributes['step'].blank? },
									allow_destroy: true

	
	validates :tittle, :description, :image, presence: true
    has_attached_file :image, styles: { :medium => "400x400#" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
