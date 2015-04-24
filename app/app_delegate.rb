class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    rootViewController = UIViewController.alloc.init
    rootViewController.title = I18n.t("major-league-pong")
    rootViewController.view.backgroundColor = UIColor.whiteColor

    navigationController = UINavigationController.alloc.initWithRootViewController(rootViewController)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = navigationController
    @window.makeKeyAndVisible

    true
  end
end
