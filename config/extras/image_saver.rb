module ImageSaver
  attr_accessor :data_stream
  attr_writer   :image_title

  def self.included(base)
    base.after_save :save_image
    base.attr_accessible :data_stream, :image_title
  end

  def image_title
    @image_title || (!self.image.nil? && !self.image.title.nil? ? self.image.title : "")
  end

  private
  def save_image
    return if !self.data_stream
    @image = self.image ? self.image : Image.new(imageable_id: self.id, imageable_type: self.class.to_s)
    @image.title = self.image_title
    @image.data_stream = self.data_stream
    @image.height = 200
    @image.width = 200
    @image.save
  end
end