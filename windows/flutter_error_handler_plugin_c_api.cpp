#include "include/flutter_error_handler/flutter_error_handler_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_error_handler_plugin.h"

void FlutterErrorHandlerPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_error_handler::FlutterErrorHandlerPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
