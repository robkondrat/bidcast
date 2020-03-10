class CreateSpaces < ActiveRecord::Migration[6.0]
  def change
    create_table :spaces do |t|
      t.integer :podcast_id
      t.integer :length
      t.boolean :active

      t.timestamps
    end
  end
end
