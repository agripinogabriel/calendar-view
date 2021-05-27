# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

target 'CalendarView' do
  use_frameworks!
  inhibit_all_warnings!

  def test_pods
    pod 'Quick', '4.0.0'
    pod 'Nimble', '9.2.0'
  end

  target 'CalendarViewTests' do
    inherit! :search_paths
    test_pods
  end

#  target 'CalendarUIViewTests' do
#    inherit! :search_paths
#    test_pods
#  end

end
