/// This enum defines the different setting types.
enum AppSettingsType {
  /// Open the accessibility settings.
  ///
  /// Only supported on Android.
  accessibility,

  /// Open the alarm settings.
  ///
  /// Only supported on Android.
  alarm,

  /// Open the APN settings.
  ///
  /// Only supported on Android.
  apn,

  /// Open the app language settings.
  ///
  /// This setting is only available on Android 13+.
  ///
  /// For configuring per-app language preferences for your app, see also:
  /// https://github.com/flutter/flutter/issues/109842#issuecomment-1500072797
  appLocale,

  /// Open the Battery Optimization settings.
  ///
  /// Only supported on Android.
  batteryOptimization,

  /// Open the Bluetooth settings.
  ///
  /// Only supported on Android.
  bluetooth,

  /// Open the Data Roaming settings.
  ///
  /// Only supported on Android.
  dataRoaming,

  /// Open the date settings.
  ///
  /// Only supported on Android.
  date,

  /// Open the Developer settings.
  ///
  /// Only supported on Android.
  developer,

  /// Open the device settings.
  ///
  /// Only supported on Android.
  device,

  /// Open the general device settings (The first page when user open Settings.)
  ///
  /// Only supported on Android.
  generalSettings,

  /// Open the display settings.
  ///
  /// Only supported on Android.
  display,

  /// Open the Hotspot settings.
  ///
  /// Only supported on Android.
  hotspot,

  /// Open the internal storage settings.
  ///
  /// Only supported on Android.
  internalStorage,

  /// Open the location settings.
  ///
  /// Only supported on Android.
  location,

  /// Open the Lock And Password settings.
  ///
  /// Only supported on Android.
  lockAndPassword,

  /// Open the request app install settings.
  ///
  /// Only supported on Android.
  manageUnknownAppSources,

  /// Open the NFC settings.
  ///
  /// Only supported on Android.
  nfc,

  /// Open the notification settings.
  ///
  /// Supported on Android and iOS 16+.
  notification,

  /// Open the security settings.
  ///
  /// Only supported on Android.
  security,

  /// Open the app settings.
  settings,

  /// Open the audio settings.
  ///
  /// Only supported on Android.
  sound,

  /// Open the subscription settings.
  ///
  /// Only supported on iOS 15+.
  subscriptions,

  /// Open the VPN settings.
  ///
  /// Only supported on Android.
  vpn,

  /// Open the wifi settings.
  ///
  /// Only supported on Android.
  wifi,

  /// Open the wireless settings.
  ///
  /// Only supported on Android.
  wireless,


}
enum PrivacyType {
  location,
  contacts,
  calendar,
  reminders,
  photos,
  bluetooth,
  microphone,
  camera,
  motion,
  homeKit,
  speechRecognition,
  mediaAndAppleMusic,
  filesAndFolders,
  fullDiskAccess,
  focus,
  accessibility,
  inputMonitoring,
  screenRecording,
  passkeysAccess,
  automation,
  appManagement,
  developerTools,
  sensitiveContentWarning,
  analyticsAndImprovements,
  appleAdvertising,
  fileVault,
  lockdownMode,
  advanced,
  extensions,
  profiles,
  legacyProfiles;

  String getRawValue() {
    return {
      PrivacyType.location: "Privacy_LocationServices",
      PrivacyType.contacts: "Privacy_Contacts",
      PrivacyType.calendar: "Privacy_Calendars",
      PrivacyType.reminders: "Privacy_Reminders",
      PrivacyType.photos: "Privacy_Photos",
      PrivacyType.bluetooth: "Privacy_Bluetooth",
      PrivacyType.microphone: "Privacy_Microphone",
      PrivacyType.camera: "Privacy_Camera",
      PrivacyType.motion: "Privacy_Motion",
      PrivacyType.homeKit: "Privacy_HomeKit",
      PrivacyType.speechRecognition: "Privacy_SpeechRecognition",
      PrivacyType.mediaAndAppleMusic: "Privacy_Media",
      PrivacyType.filesAndFolders: "Privacy_FilesAndFolders",
      PrivacyType.fullDiskAccess: "Privacy_AllFiles",
      PrivacyType.focus: "Privacy_Focus",
      PrivacyType.accessibility: "Privacy_Accessibility",
      PrivacyType.inputMonitoring: "Privacy_ListenEvent",
      PrivacyType.screenRecording: "Privacy_ScreenCapture",
      PrivacyType.passkeysAccess: "Privacy_PasskeyAccess",
      PrivacyType.automation: "Privacy_Automation",
      PrivacyType.appManagement: "Privacy_AppBundles",
      PrivacyType.developerTools: "Privacy_DevTools",
      PrivacyType.sensitiveContentWarning: "Privacy_NudityDetection",
      PrivacyType.analyticsAndImprovements: "Privacy_Analytics",
      PrivacyType.appleAdvertising: "Privacy_Advertising",
      PrivacyType.fileVault: "FileVault",
      PrivacyType.lockdownMode: "LockdownMode",
      PrivacyType.advanced: "Advanced",
    }[this]!;
  }
}