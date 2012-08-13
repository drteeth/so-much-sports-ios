class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible

    sports_controller = SportsController.alloc.init
    nav_controller = UINavigationController.alloc.initWithRootViewController(sports_controller)

    @window.rootViewController = nav_controller
    true
  end
end
