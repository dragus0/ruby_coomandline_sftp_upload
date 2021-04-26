require "./Upload.rb"

upload_sftp = Upload.new

puts "Enter the connection details. "
puts "Server (Host): "
upload_sftp.server = gets.downcase.strip!
puts "Username: "
upload_sftp.user = gets.downcase.strip!
puts "Password: "
upload_sftp.password = gets.downcase.strip!

puts "Please provide the path for the file you wish to upload:"
upload_sftp.file_path =  gets.strip!

upload_sftp.connect_upload
