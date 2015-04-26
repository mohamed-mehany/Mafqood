class RenameTypeToKindInSpammer < ActiveRecord::Migration
  def change
    remove_column :spammers, :type
    add_column :spammers, :kind, :string
  end
end
