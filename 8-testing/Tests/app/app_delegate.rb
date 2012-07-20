class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.applicationFrame)
    @window.makeKeyAndVisible

    @view_controller = ButtonController.alloc.initWithNibName(nil, bundle:nil)
    @window.rootViewController = @view_controller

    true
  end
end
