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
    (@sports.count / 2.0).ceil
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    @reuseIdentifier ||= 'sport_row'

    row1 = indexPath.row * 2

    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || SportCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifier)

    sport = @sports[row1]
    icon = UIImage.imageNamed("#{sport.name.downcase}-sport-icon.png")

    cell.col1.setBackgroundImage(icon, forState:UIControlStateNormal)
    cell.col1.addTarget(self, action:'sport_button_click:', forControlEvents:UIControlEventTouchUpInside)

    cell.col1.tag = row1

    row2 = row1 + 1
    sport2 = @sports[row2]
    if sport2
      icon2 = UIImage.imageNamed("#{sport2.name.downcase}-sport-icon.png")
      cell.col2.setBackgroundImage(icon2, forState:UIControlStateNormal)
      cell.col2.addTarget(self, action:'sport_button_click:', forControlEvents:
        UIControlEventTouchUpInside)

      cell.col2.tag = row2
    end
    cell
  end

  def sport_button_click(sender)
    game_controller = GameController.alloc.initWithSport(@sports[sender.tag])
    self.navigationController.pushViewController(game_controller, animated:true)
  end

  def tableView(tableView, heightForRowAtIndexPath:indexPath)
    return 128 + 32
  end

end
