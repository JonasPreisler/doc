class CreateParagraphs < ActiveRecord::Migration[7.0]
  def change
    create_table :paragraphs do |t|
      t.references :document, null: false, foreign_key: true
      t.string :text

      t.timestamps
    end
  end
end
