class CreateBugs < ActiveRecord::Migration[5.1]
  def change
    create_table :bugs do |t|
      t.string :title
      t.text :description
      t.integer :issue_type
      t.integer :priority
      t.integer :status

      t.timestamps
    end
  end
end
