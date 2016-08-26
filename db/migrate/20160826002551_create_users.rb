class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :user_name
      t.string :password
      t.string :image_url
      t.string :course_taken
      t.string :city

      t.timestamps
    end
  end
end
