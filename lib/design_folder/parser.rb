require 'pry'
require 'pathname'
module DesignFolder
  class Parser
    def initialize(dir = nil)
      if dir.nil?
        puts "Parsing current directory for design assets..."
        @root_dir = Pathname.new(Dir.pwd)
      elsif Dir.exist?(dir)
        puts "Parsing directory: #{dir}"
        @root_dir = Pathname.new(dir)
      else
        puts "Directory not found: #{dir}"
        return
      end

      parse_dir(@root_dir)
    end

    def parse_dir(dir)
      dir.each_child do |file_or_folder_pathname|
        if valid_dir?(file_or_folder_pathname)
          puts "Scanning: #{file_or_folder_pathname}"
          parse_dir file_or_folder_pathname
        elsif valid_asset?(file_or_folder_pathname)
          puts "Found: #{file_or_folder_pathname}"
        else
          puts "Skipping #{file_or_folder_pathname}..."
          next
        end
      end
    end

    def font?(asset)
      asset.extname.to_s =~ /\.(abf|acfm|afm|amfm|bdf|cha|chr|compositefont|dfont|eot|etx|euf|f3f|ffil|fnt|fon|fot|gdr|gf|gxf|lwfn|mcf|mf|mxf|nftr|otf|pcf|pfa|pfb|pfm|pfr|pk|pmt|sfd|sfp|suit|t65|tfm|ttc|tte|ttf|txf|vfb|vlw|vnf|woff|xfn|xft|ytf)\z/i
    end

    def image?(asset)
      asset.extname.to_s =~ /\.(bmp|gif|jpg|png|psd|thm|tif|tiff)\z/i
    end

    def valid_asset?(asset)
      (font?(asset) or asset.extname.to_s =~ /\.(ai|as|eps|fla|gif|grd|jpg|jpeg|png|pdf|odf|psd|svg|swf)\z/i)
    end

    def valid_dir?(dir)
      (Dir.exist?(dir.to_s) and dir.to_s.split('/').last =~ /^[^.]+.*/i)
    end
  end
end
