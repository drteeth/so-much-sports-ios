describe Game do

  it "intializes from a hash of attributes" do
    p = Game.new( status:'status' )

    p.status.should == 'status'
  end

end
