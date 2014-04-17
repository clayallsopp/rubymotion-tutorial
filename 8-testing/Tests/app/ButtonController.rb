class ButtonController < UIViewController
  def viewDidLoad
    super

    @button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @button.setTitle("Test me title!", forState:UIControlStateNormal)
    @button.accessibilityLabel = "Test me!"
    @button.sizeToFit
    @button.frame = CGRect.new([10, 70], @button.frame.size)
    self.view.addSubview(@button)

    @button.addTarget(self, action:'tapped', forControlEvents:UIControlEventTouchUpInside)
  end

  def tapped
    p "I'm tapped!"
    @was_tapped = true
  end
end