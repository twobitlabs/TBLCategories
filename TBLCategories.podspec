Pod::Spec.new do |s|
  s.name = 'TBLCategories'
  s.version = '1.4.8'
  s.platform = :ios, '6.0'
  s.license = 'MIT'
  s.summary = 'Some useful Objective-C categories'
  s.homepage = 'https://github.com/twobitlabs/TBLCategories'
  s.author = { 'Two Bit Labs' => 'contact@twobitlabs.com' }
  s.source = { :git => 'https://github.com/twobitlabs/TBLCategories.git', :tag => s.version.to_s }
  s.requires_arc = false
  s.source_files = '*.{h,m}'
end
