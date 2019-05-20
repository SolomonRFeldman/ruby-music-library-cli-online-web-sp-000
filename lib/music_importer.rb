class MusicImporter
  attr_reader :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    Dir["#{path}/*mp3"].collect{ |path| path.split("/").last }
  end
  
  def import
    files.each { |file| Song.create_from_filename
  end
  
end