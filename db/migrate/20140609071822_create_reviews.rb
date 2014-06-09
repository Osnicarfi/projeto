class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :user, index: true
      t.references :article, index: true
      t.integer :value

      t.timestamps
    end
  end
end
