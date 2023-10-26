class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :encrypted_password, null: false, default: ""
      t.string :name, null: false
      t.text :profile, null: false
      t.text :occupation, null: false
      t.text :position, null: false

      t.timestamps
    end
  end
end
