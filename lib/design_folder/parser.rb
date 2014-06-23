module DesignFolder
  class Parser
    def initialize
      @root_dir = Dir.new(Dir.pwd)

      # skip past '.' and '..' directories
      2.times { @root_dir.read }

      puts "Parsing directory: #{@root_dir}"
      parse_dir(@root_dir)
    end

    def parse_dir(dir)
      dir.each do |file_or_folder|
        if valid_dir?(file_or_folder)
          puts "Scanning: #{file_or_folder}"
          parse_dir Dir.new(file_or_folder)
        elsif valid_asset?(file_or_folder)
          puts "Found: #{file_or_folder}"
        else
          puts "Skipping #{file_or_folder}..."
          next
        end
      end
    end

    def font?(asset)
      asset =~ /\.(abf|acfm|afm|amfm|bdf|cha|chr|compositefont|dfont|eot|etx|euf|f3f|ffil|fnt|fon|fot|gdr|gf|gxf|lwfn|mcf|mf|mxf|nftr|otf|pcf|pfa|pfb|pfm|pfr|pk|pmt|sfd|sfp|suit|t65|tfm|ttc|tte|ttf|txf|vfb|vlw|vnf|woff|xfn|xft|ytf)\z/i
    end

    def image?(asset)
      asset =~ /\.(bmp|gif|jpg|png|psd|thm|tif|tiff)\z/i
    end

    def valid_asset?(asset)
      (font?(asset) or asset =~ /\.(ai|as|eps|fla|gif|grd|jpg|jpeg|png|pdf|odf|psd|svg|swf)\z/i)
    end

    def valid_dir?(dir)
      (Dir.exist?(dir) and dir =~ /^[^.]+.*/i)
    end
  end
end
