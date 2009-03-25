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
  end
  
end
