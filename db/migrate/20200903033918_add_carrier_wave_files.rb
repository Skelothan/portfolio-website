class AddCarrierWaveFiles < ActiveRecord::Migration[5.2]
  def change
    add_column :uploaded_files, :cw_file, :string
  end
end
