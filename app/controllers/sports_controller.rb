class SportsController < UIViewController

  def viewDidLoad
    super

    self.title = 'So Much Sports'

    tableView = UITableView.alloc.initWithFrame(self.view.bounds)
    self.view.addSubview(tableView)

    tableView.dataSource = self
    tableView.delegate = self

    @sports = %w(NHL MLB NFL UHF OOP MBK).map { |name| Sport.new(name:name) }
  end

  def tableView(tableView, numberOfRowsInSection:section)
    @sports.count
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    @reuseIdentifier ||= 'sport_row'

    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || SportCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifier)

    cell.col1.image = UIImage.imageNamed("nfl-sport-icon.png")
    cell.col2.image = UIImage.imageNamed("nhl-sport-icon.png")

    cell
  end

  def tableView(tableView, heightForRowAtIndexPath:indexPath)
    return 128
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated:true)

    game_controller = GameController.alloc.initWithSport(@sports[indexPath.row])
    self.navigationController.pushViewController(game_controller, animated:true)
  end

end