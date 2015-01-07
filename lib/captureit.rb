require "captureit/version"

module Captureit

  class << self
    # Usage: Captureit::Capture.new(url, options).capture
    # 
    # example: Captureit::Capture("http://google.com", :filename => "google.jpg").capture
    #
    def Capture(url, options = {})
      Captureit::Capture.new(url, options).capture
    end
  end

  class InvalidExtensionError < StandardError
  end

  class Capture

    # Valid image formats
    IMAGEEXTENSIONS = %w{png jpeg jpg}
    
    attr_accessor :url, :folder, :filename, :result, :cutycapt_path

    def initialize(url, options = {})
      @url = url
      @folder = options[:folder] || Dir.pwd
      @filename = options[:filename] || "captureit.jpeg"
      @cutycapt_path = options[:cutycapt_path] || find_cutycapt_path('cutycapt')
      validate_extension?(@filename)
    end

    def capture
      cmd = "#{@cutycapt_path} --url='#{@url}' --out='#{@folder}/#{@filename}'"

      `#{cmd}`

      if captured_file_exists?
        @result = expected_captured_path
      else
        @result = nil
      end
      
      @result
    end

    def validate_extension?(filename)
      raise InvalidExtensionError, "Invalid extension!" unless IMAGEEXTENSIONS.include? filename.split('.').last
    end

    private

    def find_cutycapt_path(name)
      capture_cmd_path = `which #{name}`.strip
      capture_cmd_path.empty? ? nil : capture_cmd_path
    end

    def captured_file_exists?
      File.exists?(expected_captured_path)
    end

    def expected_captured_path
      File.join(@folder, @filename)
    end

  end
end
