class DataFile < ActiveRecord::Base
  def self.save(upload, gallery, pictures)
    name =  upload['datafile'].original_filename
    directory = "public/upload/data"
    # create the file path
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
    unless Picture.find_by_path(path.split(/public/)[1])
    @picture = Picture.new
    @picture.path = path.split(/public/)[1]
    @picture.name = path.split(/data/)[1]
    @picture.desc = pictures['desc']
    @picture.gallery_id = gallery['id']
    @picture.save
    end
  end
end
