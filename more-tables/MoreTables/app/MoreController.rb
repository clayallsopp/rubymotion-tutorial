class MoreController < UIViewController
  def viewDidLoad
    super

    self.title = "More Tables"

    @data = {}
    ("A".."Z").each_with_index { |section, index|
      offset = 10*(index + 1)
      @data[section] = (offset - 10..offset).to_a.collect {|i| i.to_s}
    }

    @table = UITableView.alloc.initWithFrame(self.view.bounds)
    self.view.addSubview @table

    @table.dataSource = self
    @table.delegate = self
  end

  def sections
    @data.keys.sort
  end

  def rows_for_section(section_index)
    @data[self.sections[section_index]]
  end

  def row_for_index_path(index_path)
    rows_for_section(index_path.section)[index_path.row]
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    @reuseIdentifier ||= "CELL_IDENTIFIER"

    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifier)
    end

    # put your data in the cell
    cell.textLabel.text = row_for_index_path(indexPath)

    cell
  end

  def numberOfSectionsInTableView(tableView)
    self.sections.count
  end

  def tableView(tableView, numberOfRowsInSection: section)
    # return the number of rows
    rows_for_section(section).count
  end

  def tableView(tableView, titleForHeaderInSection:section)
    sections[section]
  end
end