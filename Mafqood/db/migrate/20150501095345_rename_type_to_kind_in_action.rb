class RenameTypeToKindInAction < ActiveRecord::Migration
  def change
    remove_column :actions, :type
    add_column :actions, :kind, :string
  end
end
