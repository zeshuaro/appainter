const common = require("./common.release.config.js");

module.exports = {
  ...common,
  plugins: [
    ...common.plugins,
    [
      "semantic-release-pub",
      {
        cli: "flutter",
        publishPub: false,
      },
    ],
    [
      "@semantic-release/exec",
      {
        prepareCmd: "bash build.sh",
      },
    ],
    "semantic-release-stop-before-publish",
  ],
};
