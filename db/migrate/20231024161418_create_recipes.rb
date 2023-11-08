class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true
      t.string :recipe_name,  null: false
      t.text :introduction,  null: false
      t.text :procedure,  null: false
      t.timestamps
    end
  end
end
