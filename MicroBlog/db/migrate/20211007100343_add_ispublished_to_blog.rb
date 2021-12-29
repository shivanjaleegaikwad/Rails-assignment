class AddIspublishedToBlog < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :ispublished, :boolean, :default => false
  end
end
