require 'test_helper'

class Document
  include Blobber::Resource
  
  DEFAULT_ATTRIBUTES = {
    :title => "My Document",
    :path => "/tmp/doc.txt",
    :collaborators => ["brian","mike"]
  }
end

class ResourceTest < Test::Unit::TestCase
  
  UUID_REGEX = /^[a-z0-9]{8}\-[a-z0-9]{4}\-[a-z0-9]{4}\-[a-z0-9]{4}\-[a-z0-9]{12}$/
  
  context "A new blobber" do
    setup do
      @document = Document.new(Document::DEFAULT_ATTRIBUTES)
    end
    
    should "have attributes" do
      assert_equal(Document::DEFAULT_ATTRIBUTES, @document.attributes)
    end
    
    should "set attributes" do
      @document.attributes = Document::DEFAULT_ATTRIBUTES.merge(:title => "New Title")
      assert_equal "New Title", @document.attributes[:title]
    end
    
    should "access attribute values by named methods" do
      assert_equal @document.attributes[:title], @document.title
    end
    
    should "generate a key in UUID format" do
      assert @document.key =~ UUID_REGEX, "Not a valid key: #{@document.key}"
    end
    
    should "have new_record? true" do
      assert @document.new_record?
    end
    
    should "set individual attribute" do
      @document.title = "New title"
      assert_equal "New title", @document.title
    end
  end
  
  context "Saving a blobber" do
    setup do
      @document = Document.new(Document::DEFAULT_ATTRIBUTES)
    end
    
    context "successfully" do
      setup do
        Blobber.connection.expects(:set).returns(true)
      end
      
      should "return true" do
        assert @document.save
      end
    
      should "set new_record? to false" do
        @document.save
        assert !@document.new_record?
      end
    end
  end
  
  context "Finding a blobber" do
    setup do
      @document = Document.new(Document::DEFAULT_ATTRIBUTES)
    end
    
    context "with a valid key" do
      setup do
        Blobber.connection.stubs(:get).returns(@document.attributes.to_json)
      end
      
      should "return document object" do
        doc = Document.find(@document.key)
        assert_equal Document, doc.class
      end
      
      should "map json object to attributes" do
        doc = Document.find(@document.key)
        assert_equal Document::DEFAULT_ATTRIBUTES[:title], doc.title
        assert_equal Document::DEFAULT_ATTRIBUTES[:path], doc.path
        assert_equal Document::DEFAULT_ATTRIBUTES[:collaborators], doc.collaborators
      end
      
      should "set new_record? to false" do
        doc = Document.find(@document.key)
        assert !doc.new_record?
      end
      
      should "have own key" do
        doc = Document.find(@document.key)
        assert_equal @document.key, doc.key
      end
    end
    
    context "with an invalid key" do
      setup do
        Blobber.connection.stubs(:get).returns(nil)
      end
      
      should "return nil" do
        assert_nil Document.find("bogus-key")
      end
    end
    
    context "with a blank key" do
      should "return nil" do
        assert_nil Document.find("")
      end
    end
    
    context "with a nil key" do
      should "return nil" do
        assert_nil Document.find(nil)
      end
    end
  end
  
  context "Destroying a blobber" do
    setup do
      Blobber.connection.stubs(:set).returns(true)
      @document = Document.new(Document::DEFAULT_ATTRIBUTES)
      @document.save
      Blobber.connection.expects(:delete).with(@document.key).returns(true)
    end
    
    should "return true" do
      assert @document.destroy
    end
  end
  
end
