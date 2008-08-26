module Caculo
  class JavascriptObject
    attr_accessor :javascript

    def initialize connection , name
      @connection = connection
      @javascript = "#{connection.caculo_object}.#{name}"
    end

    def val name
      obj = JavascriptObject.new( @connection , "" )
      obj.javascript = "#{@javascript}.#{name}"
      return obj
    end

    def val! name
      obj = JavascriptObject.new( @connection , "" )
      obj.javascript = "#{@javascript}.#{name}"
      return obj.execute
    end

    def method_missing name , *params
      obj = JavascriptObject.new( @connection , "" )

      js_parameters = params.map do |p|
        if p.kind_of? String
          "'#{p}'"
        else
          p.to_s
        end
      end

      obj.javascript = "#{@javascript}.#{name.to_s.gsub('!','').to_s}( #{js_parameters.join(',')} )"
      if name.to_s.match('!')
        return obj.execute
      else
        return obj
      end
    end

    def length
      obj = JavascriptObject.new( @connection , "" )
      obj.javascript = "#{@javascript}.length"
      return obj
    end

    def execute
      return @connection.send_command( "#{@javascript};" )
    end

    def to_s
      return @javascript
    end

  end
end
