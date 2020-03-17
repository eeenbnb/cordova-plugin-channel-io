package by.eeenbnb.cordova.channelio;

import by.chemerisuk.cordova.support.CordovaMethod;
import by.chemerisuk.cordova.support.ReflectiveCordovaPlugin;

import org.apache.cordova.CallbackContext;

import com.zoyi.channel.plugin.android.ChannelIO;
import com.zoyi.channel.plugin.android.Profile;
import com.zoyi.channel.plugin.android.ChannelPluginSettings;


public class ChannelIOPlugin extends ReflectiveCordovaPlugin {
  private static final String TAG = "ChannelIOPlugin";
  private static ChannelIOPlugin instance;

  @Override
  protected void pluginInitialize() {
   ChannelIOPlugin.instance = this;
   ChannelIO.initialize(this.cordova.getActivity().getApplication());
  }

  @CordovaMethod
  private void startWithGuestUser(String pluginKey, CallbackContext callbackContext) {
    ChannelPluginSettings settings = new ChannelPluginSettings(pluginKey);
    ChannelIO.boot(settings);
  }

  @CordovaMethod
  private void startWithRegisteredUser(String pluginKey, String userId, String name, CallbackContext callbackContext) {
   ChannelPluginSettings settings = new ChannelPluginSettings(pluginKey);
   settings.setMemberId(userId);

   Profile profile = Profile.create()
         .setName(name);

   ChannelIO.boot(settings, profile);
  }

  @CordovaMethod
  private void setDeviceToken(String token, CallbackContext callbackContext) {
    ChannelIO.initPushToken(token);
  }

  @CordovaMethod
  private void openLauncher(CallbackContext callbackContext) {
    ChannelIO.open(instance.webView.getContext());
  }

  @CordovaMethod
  private void showLauncher(CallbackContext callbackContext) {
    ChannelIO.show();
  }

  @CordovaMethod
  private void hideLauncher(CallbackContext callbackContext) {
    ChannelIO.hide();
  }
}
