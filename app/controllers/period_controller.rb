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

    # game = @period.games[indexPath.row]

    cell.status.text = "#{game.home_team.name} #{game.home_team.score} vs #{game.visiting_team.name} #{game.visiting_team.score}"

    # cell.home_team_score.text = 'hscore'
    # cell.home_team_name.text = 'hname'
    # cell.visiting_team_score.text = 'vscore'
    # cell.visiting_team_name.text = 'vname'

    # TODO add icons
    # home_icon = UIImage.imageNamed("nfl-sport-icon.png")
    # cell.home_team_icon.setBackgroundImage(home_icon, forState:UIControlStateNormal)
    # visiting_icon = UIImage.imageNamed("nhl-sport-icon.png")
    # cell.visiting_team_icon.setBackgroundImage(visiting_icon, forState:UIControlStateNormal)

    cell
  end

  def tableView(tableView, heightForRowAtIndexPath:indexPath)
    return 120 + (2 * 20)
  end

end
