class TapController < UIViewController
  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.whiteColor

    @button = UIButton.rounded_rect.tap do |b|
      b.accessibilityLabel = "Start HTTP"
      b.setTitle 'get http', forState: UIControlStateNormal
      b.frame = [[20, 100], [view.frame.size.width - 20 * 2, 42]]
      b.on(:touch) do |event|
        BW::HTTP.get('http://www.example.com/') do |response|
          p response
        end
      end
    end
    self.view << @button

    @label = UILabel.alloc.initWithFrame(CGRectZero)
    @label .text = "Taps"
    @label .sizeToFit
    @label .center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2)
    self.view.addSubview @label

    self.title = "Tap (#{self.navigationController.viewControllers.count})"

    right_button = UIBarButtonItem.alloc.initWithTitle("Push", style: UIBarButtonItemStyleBordered, target:self, action:'push')
    self.navigationItem.rightBarButtonItem = right_button

  end

  def push
    new_controller = TapController.alloc.initWithNibName(nil, bundle: nil)
    self.navigationController.pushViewController(new_controller, animated: true)
  end

  def initWithNibName(name, bundle: bundle)
    super
    self.tabBarItem = UITabBarItem.alloc.initWithTabBarSystemItem(UITabBarSystemItemFavorites, tag: 1)
    self
  end
end
