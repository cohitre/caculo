$:.unshift(File.dirname(__FILE__)) unless
$:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))


require "#{File.dirname(__FILE__)}/caculo/jquery"
require "#{File.dirname(__FILE__)}/caculo/unit"
require "#{File.dirname(__FILE__)}/caculo/javascript"
require 'open-uri'

module Caculo
  class Browser
    attr_reader :libraries
       
    # Creates a new browser window instance.
    def self.open name
      if ( name.to_s == 'firefox' )
        require "#{File.dirname(__FILE__)}/caculo/firefox"
        return Firefox.new
      elsif ( name.to_s == 'safari')
        require "#{File.dirname(__FILE__)}/caculo/safari"
        return Safari.new
      elsif ( name.to_s == 'explorer')
        require "#{File.dirname(__FILE__)}/caculo/internet_explorer"
        return InternetExplorer.new
      end
    end
    
    def initialize
      @libraries = []
      self.use( "#{File.dirname(__FILE__)}/assets/jquery-1.2.3.min.js" )
    end
    
    def use library
      @libraries.push( open( library ).read )
    end
    
    def << script
      self.send_command( script )
    end
    
    def script cmd
      c = %Q[
        ( function() {
            var doc = window.document;
            var s = doc.createElement("script");
            s.appendChild( doc.createTextNode( #{cmd.to_js} ) );
            doc.body.appendChild( s );
         } )()]
      send_command( c )      
    end

    def load_libraries!
      @libraries.each { |l| self << (l) }
    end

    def search string , &block
      obj = JQueryObject.new( string )      
      obj = yield( obj ) if block_given?
      sleep(0.1)
      return self[obj]
    end
    
    alias / :search

    def [] selector=nil
      if selector.nil?
        self << JQueryObject.new()
      elsif selector.is_a? String
        self << JQueryObject.new( selector )
      elsif selector.is_a? JQueryObject
        self << selector
      end
    end

    def visit url
      if ( url.is_a? JQueryObject )
        url = self << url
      end
      self << "window.document.location.href = #{url.to_js}" 
      sleep( 1.0 )      
      self.wait_until {|p| p.page_loaded? }
      load_libraries!
      sleep( 1.0 )
      url
    end
    
    def interval secs=0 , &block
      if block_given?
        block_result = yield self
        self << "window.setInterval( function(){ #{block_result}} , #{secs*1000} );"
      end      
    end

    def timeout secs=0 , &block
      if block_given?
        block_result = yield self
        self << "window.setTimeout( function(){ #{block_result}} , #{secs*1000} );"
      end
    end

    def wait_until num=nil , &block
      if num.nil? &&  block_given?      
        sleep 0.2
        sleep 0.2 while( !yield self )
      elsif num.nil? && block_given?
        sleep num
        sleep 0.2 while( !yield self )
      elsif !num.nil?      
        
      end
    end
        
    def error message
      jQuery("div#caculo-results ul").append( jQuery( "<li />" ).addClass("error").text( message ) )
    end

    def close
      send_command( "window.close()")
    end

    def pathname
      send_command( "window.location.pathname")
    end

    def back
      send_command("window.history.back()")
    end

    def forward
      send_command("window.history.forward()")
    end

    def close
      send_command("window.close()")
    end
  end
end

class String
  def to_js
    "'" + escape_javascript( self ) + "'"
  end
end

def escape_javascript(javascript)
  (javascript || '').gsub('\\','\0\0').gsub('</','<\/').gsub(/\r\n|\n|\r/, "\\n").gsub(/["']/) { |m| "\\#{m}" }
end

def jQuery selector=nil
  return Caculo::JQueryObject.new( selector )
end

def js_function( body , params=[] )
  return "function(#{params.join(' , ')}){ #{body} }"
end
