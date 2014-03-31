class AppDelegate
  include BW::KVO

  attr_accessor :user

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.applicationFrame)
    @window.makeKeyAndVisible

    @name_label = UILabel.alloc.initWithFrame([[0, 0], [100, 30]])
    @name_label.backgroundColor = UIColor.whiteColor
    @window.addSubview(@name_label)

    @email_label = UILabel.alloc.initWithFrame([[0, @name_label.frame.size.height + 10], @name_label.frame.size])
    @email_label.backgroundColor = UIColor.whiteColor
    @window.addSubview(@email_label)

    @id_label = UILabel.alloc.initWithFrame([[0, @email_label.frame.origin.y + @email_label.frame.size.height + 10], @name_label.frame.size])
    @id_label.backgroundColor = UIColor.whiteColor
    @window.addSubview(@id_label)

    self.user = User.new

    ["name", "id", "email"].each { |prop|
      observe(self.user, prop) do |old_value, new_value|
        instance_variable_get("@#{prop}_label").text = new_value
      end
    }

    true
  end
end
