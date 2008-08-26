require 'win32ole'

module Caculo
  class InternetExplorer < Browser

    def initialize
      @ie = WIN32OLE.new('InternetExplorer.Application')
      @ie.visible = true
    end

    def read
      @ie.Document.parentWindow.caculoResult;
    end

    def send_command cmd
      @ie.Document.parentWindow.execScript( "window.caculoResult = ''");
      @ie.Document.parentWindow.execScript( "window.caculoResult = #{cmd};\n")
      read
    end

    def location= url
      sleep 0.2
      @ie.navigate( url )
    end

    def location
      @ie.locationURL
    end

    def page_loaded?
      !@ie.Busy
    end

    def current_window
      "window"
    end

    def back
      @ie.goback
    end

    def forward
      @ie.goforward
    end

  end
end
