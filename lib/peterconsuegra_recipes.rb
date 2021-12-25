require 'colorize'


module PeterConsuegraRecipes  
  
  def self.move_templates(src_folder,dest_folder,files)
    files.each do |file_name|
      #puts "src_folder: #{src_folder} dest_folder: #{dest_folder}".blue
      FileUtils.cp(src_folder+file_name,dest_folder+file_name)
      puts "file copied to: #{dest_folder+file_name}".green
    end
  end
  
  def self.append_before_last_appearance_of(string,code,file)
    File.open(file, 'r+') do |file|
      lines = file.each_line.to_a
      length = lines.length()
      
      lines.reverse.each_with_index do |val, index|
        if val.include?(string)
          aux = lines[length-(index+1)]
          lines[length-(index+1)] = "#{code} \n"
          lines.append(aux)
          file.rewind
          file.write(lines.join)
          break
        end
      end
    end
  end
  
end
