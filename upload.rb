require "net/sftp"

class Upload
  def initialize(server="localhost", port="22", user="", password="", file_path="")
    @server = server
    @port = port
    @user = user
    @password = password
    @file_path = file_path
  end
  # attr_accessor :server, :port, :user, :password, :file_path
  attr_writer :server, :port, :user, :password, :file_path
  attr_accessor :connection_status
  def connect_upload
    Net::SFTP.start(@server, @user, :password => @password) do |sftp|
      puts "\nBefore Uploading: "     
      sftp.dir.foreach("./") do |entry|
        puts entry.longname
      end
      
      sftp.upload!(@file_path, "/#{@file_path.split("/").last}")
    
      puts "\nAfter Uploading: "    
      sftp.dir.foreach("./") do |entry|
        puts entry.longname
      end
    end
  end
end
