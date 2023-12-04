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
      "@semantic-release/npm",
      {
        npmPublish: false,
      },
    ],
    [
      "@qiwi/semantic-release-gh-pages-plugin",
      {
        src: "dist",
        msg: "chore(release): <%= nextRelease.gitTag %>",
      },
    ],
    [
      "@semantic-release/git",
      {
        assets: ["CHANGELOG.md", "package.json", "pubspec.yaml"],
      },
    ],
    [
      "@semantic-release/github",
      {
        releasedLabels: false,
        assets: [{ path: "**/appainter_*.tar.gz" }],
      },
    ],
  ],
};
