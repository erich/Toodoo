Cuba.plugin Cuba::Render
Cuba.settings[:template_engine] = "slim"
Cuba.settings[:render][:views] ||= File.expand_path("views", Dir.pwd)
