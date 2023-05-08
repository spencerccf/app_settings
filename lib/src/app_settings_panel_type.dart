/// This enum defines the different setting panel types for Android Settings Panels.
///
/// See also: https://developer.android.com/reference/android/provider/Settings.Panel
enum AppSettingsPanelType {
  /// Show a settings dialog containing settings to enable internet connection.
  ///
  /// Corresponds to `Settings.Panel.ACTION_INTERNET_CONNECTIVITY`.
  internetConnectivity,

  /// Show a settings dialog containing NFC-related settings.
  ///
  /// Corresponds to `Settings.Panel.ACTION_NFC`.
  nfc,

  /// Show a settings dialog containing all volume streams.
  ///
  /// Corresponds to `Settings.Panel.ACTION_VOLUME`.
  volume,

  /// Show a settings dialog containing controls for Wifi.
  ///
  /// Corresponds to `Settings.Panel.ACTION_WIFI`.
  wifi,
}
