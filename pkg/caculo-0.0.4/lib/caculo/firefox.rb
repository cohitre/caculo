require 'net/telnet'

module Caculo
  class Firefox < Browser

    def initialize
      super
      @telnet = Net::Telnet::new("Host" => "localhost","Port" => 9997, 
          "Prompt" => /[$%#>] /n)
      10.times { socket_send "\n" }
      socket_send 'window = getWindows()[getWindows().length-1].getBrowser().contentWindow.window'
      socket_send( "window.location = 'about:blank'" )
      wait_until { page_loaded? }
    end

    def send_command cmd
      socket_send( cmd )
    end
    
    def page_loaded?
      result = socket_send( "#{browser}.webProgress.isLoadingDocument" )
      return result =~ /false/
    end

    private
    
    def browser
      "getWindows()[getWindows().length-1].getBrowser()"      
    end

    def window
      browser+".contentWindow"
    end    
    
    def socket_send cmd  
      @telnet.cmd( " " )
      @telnet.cmd( cmd.to_s ).gsub( /\n> $/,"" )
    end
  end
end
