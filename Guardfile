# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard :test do 
	watch(%r{(.+)\.rb})  {|m| "test/#{m[1]}_test.rb"}
	watch(%r{^test/.+_test\.rb$})
end
