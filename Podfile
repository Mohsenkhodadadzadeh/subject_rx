
target 'playgroundRXswift' do
  use_frameworks!
  
  # Pods for playgroundRXswift
  pod 'RxSwift', '~> 4.0'
 pod 'RxCocoa',    '~> 4.0'
end


# Workaround for Cocoapods issue #7606
post_install do |installer|
    installer.pods_project.build_configurations.each do |config|
        config.build_settings.delete('CODE_SIGNING_ALLOWED')
        config.build_settings.delete('CODE_SIGNING_REQUIRED')
    end
end