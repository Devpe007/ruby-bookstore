class AddPolymorphismToImage < ActiveRecord::Migration[7.1]
  def up
    old_imgs = Image.all.inject({}) do |memo, img|
      memo[img.id] = img.person_id
      memo
    end

    remove_column :images, :person_id
    add_column :images, :imageable_id, :integer
    add_column :images, :imageable_type, :string
    add_index  :images, [:imageable_id, :imageable_type]

    Image.reset_column_information

    old_imgs.each do |id, person_id|
      next if person_id.blank?
      puts "Updating image #{id} with person #{person_id}"

      image = Image.find(id)
      image.update(imageable_id: person_id, imageable_type: 'Person')
    end
  end

  def down
    add_column :images, :person_id
    remove_column :images, :imageable_id
    remove_column :images, :imageable_type
    remove_index  :images, column: [:imageable_id, :imageable_type]
  end
end
