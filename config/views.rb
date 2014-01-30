Cuba.plugin Cuba::Render
Cuba.settings[:render][:template_engine] = "slim"
Cuba.settings[:render][:views] ||= File.expand_path("views", Dir.pwd)
