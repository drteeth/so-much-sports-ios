describe Period do

  it "intializes from a hash of attributes" do
    p = Period.new(
      id:'20120812',
      label:'Tue.',
      is_default:true,
      sport:'NHL',
      games:[],
    )

    p.id.should == '20120812'
    p.label.should == 'Tue.'
    p.is_default.should == true
    p.sport.should == 'NHL'
    p.games.should == []
  end

end
