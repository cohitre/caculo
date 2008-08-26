#!/opt/local/bin ruby

require 'mongrel'

class SimpleFileHandler < Mongrel::HttpHandler
  def process request , response
    response.start(200) do |head,out|
      head['Content-Type'] = 'text/plain'

      # out.write( )
    end
  end
end

def start_server
  Mongrel::Configurator.new :host => "0.0.0.0" do
    listener :port => 3000 do
      uri "/", :handler => Mongrel::DirHandler.new("#{File.dirname(__FILE__)}/public")
    end
    run
  end
end