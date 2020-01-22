class AttrAccessorObject

  def self.my_attr_accessor(*names)
    names.each do |name|

      define_method(name) { instance_variable_get("@#{name}") }
      define_method("#{name}=") { |val| instance_variable_set("@#{name}", val) }

    end
  end

end


# reset
# load '00_attr_accessor_object.rb'
# AttrAccessorObject.my_attr_accessor :x, :y
# obj = AttrAccessorObject.new