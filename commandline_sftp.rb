require "net/sftp"

class Connection_details
    def initialize(server="localhost", port="22", user="", password="")
        @server = server
        @port = port
        @user = user
        @password = password
    end
    attr_accessor :server, :port, :user, :password
    attr_accessor :connection_status    
end

connection = Connection_details.new

puts "Enter the connection details. "
puts "Server (Host): "
connection.server = gets.downcase.strip!
puts "Username: "
connection.user = gets.downcase.strip!
puts "Password: "
connection.password = gets.downcase.strip!


puts "Please provide the path for the file you wish to upload:"
filepath =  gets.strip!
Net::SFTP.start(connection.server, connection.user, :password => connection.password) do |sftp|
    puts "\nBefore Uploading: "

    sftp.dir.foreach("./") do |entry|
        puts entry.longname
    end
    
    sftp.upload!(filepath, "/#{filepath.split("/").last}")

    puts "\nAfter Uploading: "

    sftp.dir.foreach("./") do |entry|
        puts entry.longname
    end

end
