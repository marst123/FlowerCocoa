Pod::Spec.new do |spec|

  spec.name         = "FlowerCocoa"
  spec.version      = "0.0.2"
  spec.summary      = "Swift chaining syntax can be used to improve efficiency."

  spec.description  = "Swift chaining syntax can be used to improve efficiency.()"

  spec.homepage     = "https://github.com/marst123/FlowerCocoa"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "marst123" => "tianlan2325@qq.com" }
  spec.social_media_url   = "https://github.com/marst123"

  spec.source       = { :git => "https://github.com/marst123/FlowerCocoa.git", :tag => spec.version }

  spec.source_files = 'Source/*.swift'

  spec.ios.deployment_target = "9.0"
  
  spec.swift_versions = ['5.0']
end
