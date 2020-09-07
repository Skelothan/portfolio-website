class RemoveUrlFromFiles < ActiveRecord::Migration[5.2]
  def change
    if ::ActiveRecord::Base.connection_config[:adapter] == 'sqlite3'
      if c = ::ActiveRecord::Base.connection
          c.execute 'PRAGMA defer_foreign_keys = ON'
      end
    end
    remove_column :uploaded_files, :url, :string
  end
end
