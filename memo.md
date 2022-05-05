## permission_handler を使うにあたっての設定

https://pub.dev/packages/permission_handler

### ios/Podfile
- `installer.pods_project.targets.each do |target|` の直下に以下のコードを追加

```
target.build_configurations.each do |config|
      config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= [
        '$(inherited)',
        # 設定画面を開きたい機能は `PERMISSION_~` 先頭の#を削除する 
        # dart: PermissionGroup.calendar
        # 'PERMISSION_EVENTS=1',

        # dart: PermissionGroup.reminders
        # 'PERMISSION_REMINDERS=1',

        # dart: PermissionGroup.contacts
        # 'PERMISSION_CONTACTS=1',

        # dart: PermissionGroup.camera
        'PERMISSION_CAMERA=1',

        # dart: PermissionGroup.microphone
        # 'PERMISSION_MICROPHONE=1',

        # dart: PermissionGroup.speech
        # 'PERMISSION_SPEECH_RECOGNIZER=1',

        # dart: PermissionGroup.photos
        # 'PERMISSION_PHOTOS=1',

        # dart: [PermissionGroup.location, PermissionGroup.locationAlways, PermissionGroup.locationWhenInUse]
        # 'PERMISSION_LOCATION=1',

        # dart: PermissionGroup.notification
        'PERMISSION_NOTIFICATIONS=1',

        # dart: PermissionGroup.mediaLibrary
        # 'PERMISSION_MEDIA_LIBRARY=1',

        # dart: PermissionGroup.sensors
        # 'PERMISSION_SENSORS=1',
      ]
    end
```

### ios/Runner/Info.plist
- `ios/Podfile` 内でコメントアウトした機能についての説明を追加する

### android/gradle.properties
- `android.useAndroidX`、`android.enableJetifier` を `true` にする

