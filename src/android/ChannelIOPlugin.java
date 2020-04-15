package by.eeenbnb.cordova.channelio;

import by.chemerisuk.cordova.support.CordovaMethod;
import by.chemerisuk.cordova.support.ReflectiveCordovaPlugin;

import org.apache.cordova.CallbackContext;

import com.zoyi.channel.plugin.android.ChannelIO;
import com.zoyi.channel.plugin.android.Profile;
import com.zoyi.channel.plugin.android.ChannelPluginSettings;
import com.zoyi.channel.plugin.android.OnBootListener;
import com.zoyi.channel.plugin.android.ChannelPluginCompletionStatus;
import com.zoyi.channel.plugin.android.User;

import java.util.Map;


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
    ChannelIO.boot(settings, new InitEvent());
  }

  @CordovaMethod
  private void startWithRegisteredUser(String pluginKey, String userId, String name, CallbackContext callbackContext) {
    ChannelPluginSettings settings = new ChannelPluginSettings(pluginKey);
    settings.setMemberId(userId);

    Profile profile = Profile.create()
       .setName(name);

    ChannelIO.boot(settings, profile, new InitEvent());
  }

  @CordovaMethod
  private void startWithRegisteredUserAndEmail(String pluginKey, String userId, String name, String email, CallbackContext callbackContext) {
    ChannelPluginSettings settings = new ChannelPluginSettings(pluginKey);
    settings.setMemberId(userId);

    Profile profile = Profile.create()
         .setName(name)
         .setEmail(email);

    ChannelIO.boot(settings, profile, new InitEvent());
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

  @CordovaMethod
  private void track(String eventName, Map<String, Object> properties, CallbackContext callbackContext) {
    ChannelIO.track(eventName, properties);
  }
}

class InitEvent implements OnBootListener {
  public void onCompletion(ChannelPluginCompletionStatus status, User guest){
    ChannelIO.track("init_cordova_channelio");
  }
}
