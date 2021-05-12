require "colorize"

extensions = {
  ".sh" => :green,
  ".cr" => :white, 
}


paths = Dir.new(ARGV.fetch(0, ".")).map { |f| Path.new(f) }

paths.sort! { |a, b| (File.directory?(a) == File.directory?(b)) ? 1 : 0 }
paths.each do |file|
  
  if File.directory?(file)
    puts file.colorize(:blue)
  else
    ext = File.extname(file)
    puts file.colorize extensions[ext]
  end
end