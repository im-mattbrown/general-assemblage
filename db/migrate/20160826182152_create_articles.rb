class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :content
      t.string :city
      t.string :article_type
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
