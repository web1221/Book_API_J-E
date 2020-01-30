class AddUsers < ActiveRecord::Migration[5.2]
    def change
        create_table :users do |t|
            t.string :email
            t.string :uuid
            t.string :password_hash
            t.string :password_salt
            t.boolean :admin, default: false

            t.timestamps
        end
    end
end
