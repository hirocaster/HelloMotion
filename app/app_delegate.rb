class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)

    # alert = UIAlertView.new
    # alert.message = "Hello Motion!"
    # alert.show


    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window .makeKeyAndVisible

    controller = TapController.alloc.initWithNibName(nil, bundle: nil)
    @window .rootViewController = UINavigationController.alloc.initWithRootViewController(controller)

    # @blue_view = UIView.alloc.initWithFrame(CGRectMake(10, 10, 100, 100))
    # @blue_view .backgroundColor = UIColor.blueColor
    # @window .addSubview(@blue_view)

    # @green_view = UIView.alloc.initWithFrame(CGRectMake(30, 30, 40, 40))
    # @green_view .backgroundColor = UIColor.greenColor
    # @window .addSubview(@green_view)

    # @red_view = UIView.alloc.initWithFrame(CGRectMake(30, 30, 40, 40))
    # @red_view .backgroundColor = UIColor.redColor

    # @blue_view .addSubview(@red_view)

    true
  end
end
