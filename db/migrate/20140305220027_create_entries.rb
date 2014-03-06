class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :bibkey
      t.integer :fk_user
      t.string :fk_type
      t.string :author
      t.string :author_sortkey
      t.string :title
      t.integer :year
      t.string :editor
      t.string :booktitle
      t.string :publisher_name
      t.string :publisher_address
      t.string :publisher_url
      t.string :institution_name
      t.string :institution_address
      t.string :institution_url
      t.string :school_name
      t.string :school_address
      t.string :school_url
      t.string :keywords
      t.string :series
      t.string :volume
      t.string :chapter
      t.string :pages
      t.string :number
      t.string :journal
      t.string :crossref
      t.string :typpe
      t.string :edition
      t.string :howpublished
      t.string :url
      t.string :pdfurl
      t.string :psurl
      t.text :abstract
      t.string :issn
      t.string :isbn
      t.string :note
      t.string :fk_status
      t.integer :timestamp

      t.timestamps
    end
  end
end
