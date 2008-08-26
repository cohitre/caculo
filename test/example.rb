require File.dirname(__FILE__) + '/../lib/caculo'
require File.dirname(__FILE__) + '/../server/server'

include Caculo

page = Caculo::Browser.open(:safari)
page.visit( "http://www.google.com" )
sleep 0.2
page[ jQuery( "input[name=q]" ).val("cohitre") ]
page[ jQuery( "form[name=f]" ).submit ]
