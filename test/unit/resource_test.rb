require 'test_helper'

class Document; include Blobber::Resource; end

class ResourceTest < Test::Unit::TestCase
  
  context "A blobber" do
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
  end
  
end
