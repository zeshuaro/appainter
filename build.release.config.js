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
        prepareCmd: "./scripts/build.sh",
      },
    ],
    "semantic-release-stop-before-publish",
  ],
};
