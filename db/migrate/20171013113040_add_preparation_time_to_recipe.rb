class AddPreparationTimeToRecipe < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :preparation_time, :number
  end
end
