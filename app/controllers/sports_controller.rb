class SportsController < UIViewController

  def viewDidLoad
    super

    self.title = 'So Much Sports'

    tableView = UITableView.alloc.initWithFrame(self.view.bounds)
    self.view.addSubview(tableView)

    tableView.dataSource = self
    tableView.delegate = self

    @sports = %w(NHL MLB NFL MLS NBA).map { |name| Sport.new(name:name) }
  end

  def tableView(tableView, numberOfRowsInSection:section)
    # we have two columns, so cut the row count in 2
    (@sports.count / 2.0).ceil
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    # get the cell
    @reuseIdentifier ||= 'sport_row'
    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || SportCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifier)

    # set the columns up
    row = indexPath.row * 2
    set_col_style(cell.col1,row)
    set_col_style(cell.col2,row + 1)

    # return the cell
    cell
  end

  def set_col_style(columnView, index)
    sport = @sports[index]
    if sport
      # set the icon
      icon = UIImage.imageNamed("#{sport.name.downcase}-sport-icon.png")
      columnView.setBackgroundImage(icon, forState:UIControlStateNormal)

      # set the click event
      columnView.addTarget(self, action:'sport_button_click:', forControlEvents:
        UIControlEventTouchUpInside)

      # remember the index in the sport array
      columnView.tag = index
    end
  end

  def sport_button_click(sender)
    # create a new game controller and push it on the stack
    game_controller = GameController.alloc.initWithSport(@sports[sender.tag])
    self.navigationController.pushViewController(game_controller, animated:true)
  end

  def tableView(tableView, heightForRowAtIndexPath:indexPath)
    # icon size and padding
    # TODO consider retina
    # TODO DRY up this value with the SportCell
    return 128 + 32
  end

end
