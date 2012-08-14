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

    cell = tableView.dequeueReusableCellWithIdentifier(@cellId) || UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@cellId)

    cell.textLabel.text = @period.games[indexPath.row].status

    cell
  end

end
