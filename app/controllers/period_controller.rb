class PeriodController < UIViewController

  def initWithPeriod(period)
    self.init
    @period = period
    self.title = "#{@period.sport} #{@period.label}"
    self
  end

  def viewDidLoad
    super

    status_bar_height = UIApplication.sharedApplication.statusBarFrame.size.height
    bounds = self.view.bounds.size
    tableView = UITableView.alloc.initWithFrame([[0,0], [bounds.width, bounds.height - status_bar_height - 16]])

    tableView.dataSource = self
    tableView.delegate = self

    self.view.addSubview tableView
  end

  def tableView(tableView, numberOfRowsInSection:section)
    @period.games.count
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    @cellId ||= 'cell_id'

    cell = tableView.dequeueReusableCellWithIdentifier(@cellId) || GameCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@cellId)

    game = @period.games[indexPath.row]
    cell.status.text = "#{game.home_team.name} #{game.home_team.score} vs #{game.visiting_team.name} #{game.visiting_team.score}"
    cell
  end

  def tableView(tableView, heightForRowAtIndexPath:indexPath)
    return 120 + (2 * 20)
  end

end
