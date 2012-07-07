class AlphabetController < UIViewController
  def viewDidLoad
    super

    new_frame = self.view.frame
    new_frame.size.height -= self.tabBarController.tabBar.bounds.size.height
    self.view.frame = new_frame

    self.title = "Alphabet"

    @table = UITableView.alloc.initWithFrame(self.view.bounds)
    self.view.addSubview @table

    @table.dataSource = self
    @table.delegate = self

    @data = ("A".."Z").to_a
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    @reuseIdentifier ||= "CELL_IDENTIFIER"

    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifier)
    end

    # put your data in the cell
    cell.textLabel.text = @data[indexPath.row]

    cell
  end

  def tableView(tableView, numberOfRowsInSection: section)
    # return the number of rows
    @data.count
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated: true)

    alert = UIAlertView.alloc.init
    alert.message = "#{@data[indexPath.row]} tapped!"
    alert.addButtonWithTitle "OK"
    alert.show
  end
end