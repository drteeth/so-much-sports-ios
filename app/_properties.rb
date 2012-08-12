module Properties

  def self.included(klass)
    klass.extend ClassMethods
  end

  def init_attributes(attributes)
    attributes.each do |key,value|
      self.send("#{key}=", value) if properties.member?(key)
    end
  end

  def properties
    self.class.all_properties
  end

  def initWithCoder(decoder)
    self.init
    properties.each { |prop|
      value = decoder.decodeObjectForKey(prop.to_s)
      self.send((prop.to_s + "=").to_s, value) if value
    }
    self
  end

  def encodeWithCoder(encoder)
    properties.each { |prop|
      encoder.encodeObject(self.send(prop), forKey: prop.to_s)
    }
  end

  module ClassMethods
    attr_reader :all_properties

    def properties(*props)
      props.each { |property|
        attr_accessor property
      }
      @all_properties = props
    end
  end

end
