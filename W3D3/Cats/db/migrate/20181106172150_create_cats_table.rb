class CreateCatsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :cats do |t|
    	t.string :name, null: false
    	t.timestamps
    end

    # self.create_table(:cats_tables) do |t|
    # end
  end
end
