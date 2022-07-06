Pod::Spec.new do |spec|

  spec.name         = "FlowerCocoa"
  spec.version      = "0.0.1"
  spec.summary      = "A short description of FlowerCocoa."

  spec.description  = <<-DESC
TODO: Add long description of the pod here.
DESC

  spec.homepage     = "https://github.com/marst123"
  spec.license      = "MIT"
  spec.author             = { "marst123" => "tianlan2325@qq.com" }
  spec.source       = { :git => "https://github.com/marst123/FlowerCocoa", :tag => "#{spec.version}" }
  
  spec.ios.deployment_target = "9.0"

  spec.source_files  = "Source/*.swift"
  
  spec.swift_versions = '5.1'
end
