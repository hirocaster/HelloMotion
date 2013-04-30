class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)

    # alert = UIAlertView.new
    # alert.message = "Hello Motion!"
    # alert.show


    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    # @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.applicationFrame)
    @window .makeKeyAndVisible

    controller = TapController.alloc.initWithNibName(nil, bundle: nil)
    nav_controller =  UINavigationController.alloc.initWithRootViewController(controller)
    alphabet_controller = AlphabetController.alloc.initWithNibName(nil, bundle: nil)

    other_controller = UIViewController.alloc.initWithNibName(nil, bundle: nil)
    other_controller.title = "Other"
    other_controller.view.backgroundColor = UIColor.purpleColor

    animation_controller = UIViewController.alloc.initWithNibName(nil, bundle: nil)
    animation_controller.title = "animation"
    @points = [[0, 0], [50,0], [0, 50], [50, 50]]
    @current_index = 0

    animation_controller.view = UIView.alloc.initWithFrame [ @points [ @current_index ], [100, 100]]
    animation_controller.view.backgroundColor = UIColor.blueColor
    
    tab_controller = UITabBarController.alloc.initWithNibName(nil, bundle: nil)
    tab_controller.viewControllers = [alphabet_controller, nav_controller, other_controller, animation_controller]
    
    @window .rootViewController = tab_controller

    # @blue_view = UIView.alloc.initWithFrame(CGRectMake(10, 10, 100, 100))
    # @blue_view .backgroundColor = UIColor.blueColor
    # @window .addSubview(@blue_view)

    # @green_view = UIView.alloc.initWithFrame(CGRectMake(30, 30, 40, 40))
    # @green_view .backgroundColor = UIColor.greenColor
    # @window .addSubview(@green_view)

    # @red_view = UIView.alloc.initWithFrame(CGRectMake(30, 30, 40, 40))
    # @red_view .backgroundColor = UIColor.redColor

    # @blue_view .addSubview(@red_view)

    # animations
    
    animate_to_next_point(animation_controller)
    
    true
  end

  def animate_to_next_point(animation_controller)
    @current_index += 1
    @current_index = @current_index % @points.count

    UIView.animateWithDuration(
      2,
      animations: lambda {
        animation_controller.view.frame = [@points[@current_index], [100, 100]]
      },
      completion: lambda { |finished|
        self.animate_to_next_point(animation_controller)
      }
    )
    # UIView.animateWithDuration(
    #   2,
    #   delay: 1,
    #   options: UIViewAnimationOptionCurveLinear,
    #   animations: lambda {
    #     @view.frame = [@points[@current_index], [100, 100]]
    #   },
    #   completion: lambda { |finished|
    #     self.animate_to_next_point
    #   }
    # )
  end
end

