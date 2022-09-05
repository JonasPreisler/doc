class PagesController < ApplicationController
  def home
    require 'docx'

    @doc1 = Docx::Document.open("#{Rails.root}/public/hello1.docx")
    @doc2 = Docx::Document.open("#{Rails.root}/public/hello1.docx")
    @doc1.paragraphs.each do |p|
      puts p
      p '---'
    end
  end
end
