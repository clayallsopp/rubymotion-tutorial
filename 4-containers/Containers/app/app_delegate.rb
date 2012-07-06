class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible

    controller = TapController.alloc.initWithNibName(nil, bundle: nil)
    nav_controller = UINavigationController.alloc.initWithRootViewController(controller)
    other_controller = UIViewController.alloc.initWithNibName(nil, bundle: nil)
    other_controller.title = "Other"
    other_controller.view.backgroundColor = UIColor.purpleColor

    tab_controller = UITabBarController.alloc.initWithNibName(nil, bundle: nil)
    tab_controller.viewControllers = [nav_controller, other_controller]
    @window.rootViewController = tab_controller

    true
  end
end
