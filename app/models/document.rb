class Document < ApplicationRecord
  has_many :paragraphs, dependent: :destroy
  mount_uploader :file, DocumentUploader

  after_create :create_paragraphs

  def create_paragraphs
    doc = Docx::Document.open("#{Rails.root}/public#{file.url}")
    doc.paragraphs.each_with_index do |paragraph, index|
      par = Paragraph.create(
        document: self,
        text: paragraph,
        number: index + 1
      )
      if par.document == Document.all.second &&
        par.text != Document.first.paragraphs.find_by_number(index + 1).text
        par.update(changed_paragraph: true)
      end
    end
  end
end
