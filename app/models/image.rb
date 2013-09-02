class Image < ActiveRecord::Base
  attr_accessible :enterprise_id, :title, :imageable_id, :imageable_type
  after_save 	  :update_file
  after_destroy   :delete_file

  attr_accessor :data_stream, :width, :height

  belongs_to :imageable, :polymorphic => true

  def filename
  	"#{self.id}.jpg"
  end

  def path
  	"/images/#{imageable_type.pluralize.downcase}/"
  end

  def to_s
  	"#{path}#{filename}"
  end

  def full_path
  	"#{Rails.root}/public/#{path}/#{filename}"
  end

  def update_file
  	data = data_stream && data_stream.read
  	return false if !data || data.nil? || data.size<1
  	delete_file

  	dir = File.expand_path(File.dirname(full_path))
  	FileUtils.mkpath(dir) if !Dir.exist?(dir)
  	File.open(full_path,"wb") do |file|
  	file.write(data)
  end
  	if @width || @height
  		image = MiniMagick::Image.new(full_path)
  		width = image["width"].to_f
  		height = image["height"].to_f
  		@width = (width/(height/@height.to_f)).to_i if !@width
  		@height = (height/(width/@width.to_f)).to_i if !@height
  		image.resize "!#{@width}x#{@height}"
  	end
  	File.size(full_path)>0
  end

  def delete_file
  	File.unlink(full_path) if File.exist?(full_path)
  end
end