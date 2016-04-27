class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :description
      t.boolean :done

      t.timestamps null: false
    end
  end
end
