require 'hoe'

Hoe.new("caculo", '0.0.7') do |p|
  p.developer("carlos rodriguez", "carlosrr@gmail.com")
  p.description = "Caculo lets you simulate interaction with a browser via Ruby. It has the option to load a Javascript Library and call Javascript functions on the document. This allows for simple code that takes advantage of exisiting libraries."
  p.summary = "Caculo lets you simulate interaction with a browser via Ruby. It has the option to load a Javascript Library and call Javascript functions on the document. This allows for simple code that takes advantage of exisiting libraries."
  p.url = "http://code.cohitre.com"
  p.test_globs = ["test/**/test_*.rb"]
  p.clean_globs |= ['**/.*.sw?', '*.gem', '.config', '**/.DS_Store']  #An array of file patterns to delete on clean.
  
end