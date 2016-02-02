var Module = module.exports = {};


// Detect tmux version first.
var child_process = require("child_process");
var version = child_process.execFileSync("tmux", ["-V"], {
  encoding: "utf-8"
});
var TMUX_VERSION = version.substr(4).trim();


/**
 * Renders the block only if the version of tmux is
 * greater or equal to the required version.
 */
Module.ifTmuxVer = function ifTmuxVer(required, options) {
  if (TMUX_VERSION >= required) {
    return options.fn(this);
  } else {
    return options.inverse(this);
  }
};
