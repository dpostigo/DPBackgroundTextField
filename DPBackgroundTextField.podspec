Pod::Spec.new do |s|
  s.name         = "DPBackgroundTextField"
  s.version      = "0.0.1"
  s.summary      = "NSTextField with background view."
  s.homepage     = "http://dpostigo.com"
  s.license      = 'BSD'
  s.author       = { "Dani Postigo" => "dani@firstperson.is" }

  s.frameworks   = 'Foundation', 'QuartzCore'
  s.platform     = :osx, '10.7'
  s.source       = { :git => "https://github.com/dpostigo/DPBackgroundTextField.git", :tag => s.version.to_s }
  s.source_files = 'DPBackgroundTextField/*.{h,m}'



  s.dependency   'CALayer-DPUtils'
  s.dependency   'NSView-NewConstraints'

  s.requires_arc = true

end
