Pod::Spec.new do |s|
  s.name             = 'media_core_native'
  s.version          = '0.2.0'
  s.summary          = 'Native platform capability probe for media_core.'
  s.description      = <<-DESC
Reads what this device can do - VideoToolbox hardware decoding, system
picture-in-picture support, display range, memory and CPU - and answers
media_core's platform provider with it.
                       DESC
  s.homepage         = 'https://github.com/liuchuancong/media_core'
  s.license          = { :type => 'MIT' }
  s.author           = { 'liuchuancong' => 'noreply@example.com' }
  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'

  s.ios.deployment_target = '12.0'

  s.ios.dependency 'Flutter'

  s.ios.frameworks = 'VideoToolbox', 'CoreVideo', 'UIKit', 'AVKit'

  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end
