module.exports = {
  branches: ["main"],
  plugins: [
    "@semantic-release/commit-analyzer",
    "@semantic-release/release-notes-generator",
    "@semantic-release/changelog",
  ],
  preset: "conventionalcommits",
  presetConfig: {
    types: [
      {
        type: "feat",
        section: "Features",
      },
      {
        type: "feature",
        section: "Features",
      },
      {
        type: "fix",
        section: "Bug Fixes",
      },
      {
        type: "perf",
        section: "Performance Improvements",
      },
      {
        type: "revert",
        section: "Reverts",
      },
      {
        type: "docs",
        section: "Documentation",
      },
      {
        type: "style",
        section: "Styles",
      },
      {
        type: "chore",
        section: "Miscellaneous Chores",
      },
      {
        type: "refactor",
        section: "Code Refactoring",
      },
      {
        type: "test",
        section: "Tests",
      },
      {
        type: "build",
        section: "Build System",
      },
      {
        type: "ci",
        section: "Continuous Integration",
      },
    ],
  },
};
