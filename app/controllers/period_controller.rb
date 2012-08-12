class PeriodController < UIViewController

  def initWithPeriod(period)
    self.init
    @period = period
    self
  end

  def viewDidLoad
    super

    self.title = "#{@period.sport} #{@period.label}"

    tableView = UITableView.alloc.initWithFrame(self.view.bounds)
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

    cell.textLabel.text = @period.games[indexPath.row].to_s

    cell
  end

end