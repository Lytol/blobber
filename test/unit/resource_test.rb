require 'test_helper'

class Document; include Blobber::Resource; end

class ResourceTest < Test::Unit::TestCase
  
  UUID_REGEX = /^[a-z0-9]{8}\-[a-z0-9]{4}\-[a-z0-9]{4}\-[a-z0-9]{4}\-[a-z0-9]{12}$/
  
  context "A new blobber" do
    setup do
      @document = Document.new(:title => "My Document", :path => "/tmp/doc.txt", :collaborators => ["brian","mike"])
    end
    
    should "have attributes" do
      assert_equal({:title => "My Document", :path => "/tmp/doc.txt", :collaborators => ["brian","mike"]}, @document.attributes)
    end
    
    should "set attributes" do
      @document.attributes = {:title => "New Title", :path => "/tmp/doc.txt", :collaborators => ["brian","mike"]}
      assert_equal "New Title", @document.attributes[:title]
    end
    
    should "access attribute values by named methods" do
      assert_equal @document.attributes[:title], @document.title
    end
    
    should "have a uuid" do
      assert @document.uuid =~ UUID_REGEX, "Not a valid uuid: #{@document.uuid}"
    end
    
    should "have new_record? true" do
      assert @document.new_record?
    end
  end
  
  context "Saving a blobber" do
    setup do
      @document = Document.new(:title => "My Document", :path => "/tmp/doc.txt", :collaborators => ["brian","mike"])
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
  
end
