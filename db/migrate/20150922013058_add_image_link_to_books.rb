class AddImageLinkToBooks < ActiveRecord::Migration
  def change
    add_column :books, :image_link, :string
  end
end
