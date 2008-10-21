require "rubygems"
require "caculo"

page = Caculo::Browser.open(:safari)
page.visit( "http://www.google.com" )
page.search("input[name=q]") { |obj| obj.val("cohitre") }
page.search("form[name=f]") { |form| form.submit }
sleep(1)
page.load_libraries!
sleep(1)
puts page.search("ol li:first a:first"){|f| f.text }
puts page.search("ol li:first a:first"){|f| f.attr("href") }



