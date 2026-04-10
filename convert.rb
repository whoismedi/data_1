require 'json'

raw_file = File.read('task1_d.json', encoding: 'UTF-8')

data = eval(raw_file) 

proper_file = JSON.pretty_generate(data)

output_path = File.join(__dir__, 'output.json')
File.write(output_path, proper_file)

puts "Saved to #{output_path}"


