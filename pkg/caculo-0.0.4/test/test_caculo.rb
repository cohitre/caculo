require File.dirname(__FILE__) + '/../lib/caculo'
require File.dirname(__FILE__) + '/../server/server'

include Caculo

start_server

page = Caculo::Browser.open(:safari)

page.visit( "http://localhost:3000".to_js )

page[ JQueryObject.get("_finished.html") ]

center_column = jQuery("<div />").attr("id", "center-column").css("margin" , "0 auto").width( 500 ).css("border" , "1px solid black").text("")
left_column = jQuery("<div />").attr("id" , "left-column").css("float","left").css("width" , 100 )

links_list = ["http://yahoo.com" , "http://cohitre.com"  ].map { |url| jQuery("<li />").append( jQuery("<a />").attr("href", url ).text(url) ) }

page[ jQuery("body").append( left_column.text("left column") , center_column ) ]
page[ jQuery('#center-column').append( jQuery("<ul />").append( links_list ) ) ]
page[ jQuery("body").append( jQuery("<div />").attr('id','element').text("This is the caculo test sandbox") ) ]
page[jQuery("<div />").css( "position" , "absolute" ).css( "background-color" , "purple").appendTo( jQuery("body") ).text("dododo")]
page.timeout( 3 ) { jQuery("#element").text('Done') }

page.wait_until {  page[jQuery("#element").text] == "Done" }

page << "(#{js_function( "window.alert( 'a' )" )})()"