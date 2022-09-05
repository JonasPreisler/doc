class AddChangedToParagraph < ActiveRecord::Migration[7.0]
  def change
    add_column :paragraphs, :changed_paragraph, :boolean, default: false
  end
end
