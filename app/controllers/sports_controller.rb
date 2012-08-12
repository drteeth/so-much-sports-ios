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

    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifier)

    cell.textLabel.text = @sports[indexPath.row].name
    cell.imageView.image = UIImage.imageNamed("nfl-sport-icon.png")

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