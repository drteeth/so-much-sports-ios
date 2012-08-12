describe Sport do

  it "intializes from a hash of attributes" do
    p = Sport.new(name:'name',foo:'foo')
    p.name.should == 'name'
    p.respond_to?('foo').should == false
  end

  it "can save to user defaults" do
    defaults = NSUserDefaults.standardUserDefaults

    sport = Sport.new()
    sport.name = 'NFL'

    defaults["sport"] = NSKeyedArchiver.archivedDataWithRootObject(sport)
    other = NSKeyedUnarchiver.unarchiveObjectWithData(defaults["sport"])

    other.name.should == sport.name
  end

end
