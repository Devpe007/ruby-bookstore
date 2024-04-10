module ImageSaver
  extend ActiveSupport::Concern

  included do
    after_action :save_image, only: [:create, :update]
  end

  private

  def save_image
    stream = params[:data_stream]

    return unless stream.present?
    save(image, stream)
  end

  def image
    name = controller_name.singularize
    ref = instance_variable_get("@#{name}")
    img = ref.image
    return img if img

    Image.new(title: image.title_ref, imageable_id: ref.id, imageable_type: name.camelize)
  end

  def save(image, stream)
    image = image
    image.data_stream = stream
    image.height = 200
    image.save
  end
end
