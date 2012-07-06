class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible

    @blue_view = UIView.alloc.initWithFrame(CGRectMake(10, 10, 100, 100))
    @blue_view.backgroundColor = UIColor.blueColor
    @window.addSubview(@blue_view)

    @green_view = UIView.alloc.initWithFrame(CGRectMake(30, 30, 40, 40))
    @green_view.backgroundColor = UIColor.greenColor
    @window.addSubview(@green_view)

    @red_view  = UIView.alloc.initWithFrame(CGRectMake(30, 30, 40, 40))
    @red_view.backgroundColor = UIColor.redColor
    # NOTE. NOT ADDING TO @window
    @blue_view.addSubview(@red_view)

    true
  end
end
