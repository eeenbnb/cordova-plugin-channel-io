var exec = require("cordova/exec");
var PLUGIN_NAME = "ChannelIOPlugin";

module.exports = {
    startWithGuestUser: function(plugKey) {
        return new Promise(function(resolve, reject) {
            exec(resolve, reject, PLUGIN_NAME, "startWithGuestUser", [plugKey]);
        });
    },
    startWithRegisteredUser: function(plugKey, id, name) {
        return new Promise(function(resolve, reject) {
            exec(resolve, reject, PLUGIN_NAME, "startWithRegisteredUser", [plugKey, id, name]);
        });
    },
    startWithRegisteredUserAndEmail: function(plugKey, id, name, email) {
        return new Promise(function(resolve, reject) {
            exec(resolve, reject, PLUGIN_NAME, "startWithRegisteredUserAndEmail", [plugKey, id, name, email]);
        });
    },
    setDeviceToken: function(token) {
        return new Promise(function(resolve, reject) {
            exec(resolve, reject, PLUGIN_NAME, "setDeviceToken", [token]);
        });
    },
    openLauncher: function() {
        return new Promise(function(resolve, reject) {
            exec(resolve, reject, PLUGIN_NAME, "openLauncher", []);
        });
    },
    showLauncher: function() {
        return new Promise(function(resolve, reject) {
            exec(resolve, reject, PLUGIN_NAME, "showLauncher", []);
        });
    },
    hideLauncher: function() {
        return new Promise(function(resolve, reject) {
            exec(resolve, reject, PLUGIN_NAME, "hideLauncher", []);
        });
    },
    track: function(eventName,eventProperty) {
        return new Promise(function(resolve, reject) {
            exec(resolve, reject, PLUGIN_NAME, "event", [eventName, eventProperty]);
        });
    },
};
