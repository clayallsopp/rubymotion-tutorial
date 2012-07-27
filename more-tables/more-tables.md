# More Tables

## Sections

Your first exposure to tables just had rows, but tables can also have "sections".

If you go to Phone.app or Contacts.app, you'll notice that the alphabetical listing of your contacts has these "sticky" headers at the top of the screen that denote which part of the alphabet you're on. These are the default `UITableView` section dividers. You'll also notice a bar on the right side that corresponds to these sections; this is also a default behavior of `UITableView` and sections

Adding sections to a table is pretty easy: you just need to implement a few more methods and add some more logic in your existing `dataSource` implementations. Ideally, your data should be structured as a hash where the keys are your section identifiers and their values are the rows contained in that section. Take our alphabet as an example:

```ruby
@data = { "A" => ["Adam", "Apple"], "B" => ["Barry", "Berry"], "C" => ["Carlos", "Charlie"], ....}
```

You get the idea. Your data doesn't absolutely *have* to be a hash, but you should have a way of referencing sections by index and then accessing the row data inside each section using a separate index.

It's often useful to just create some helper methods in your controller so you don't repeat a lot of the same lookup code, which can be a pain if you change your structure later:

```ruby
  def sections
    @data.keys.sort
  end

  def rows_for_section(section_index)
    @data[self.sections[section_index]]
  end

  def row_for_index_path(index_path)
    rows_for_section(index_path.section)[index_path.row]
  end
```

The first method you need to implement is the `dataSource` method `numberOfSectionsInTableView`, which should return exactly what it says. Using the above hash, you would write:

```ruby
def numberOfSectionsInTableView(tableView)
    self.sections.count
end
```

You also need to adjust your `numberOfRowsInSection:` method to work with your section'd data:

```ruby
def tableView(tableView, numberOfRowsInSection: section)
  rows_for_section(section).count
end
```

Pretty straight-forward stuff so far.

Now, to get those teal headers on your table, you need to implement `tableView:titleForHeaderInSection:`. This should return a `String`:

```ruby
def tableView(tableView, titleForHeaderInSection:section)
  sections[section]
end
```

Finally, your `cellForRowAtIndexPath` should use our new `row_for_index_path` method to get the correct row data:

```ruby
def tableView(tableView, cellForRowAtIndexPath: indexPath)
  ...
  cell.textLabel.text = row_for_index_path(indexPath)

  cell
end
```