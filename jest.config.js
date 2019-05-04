module.exports = {
  preset: "ts-jest",
  testMatch: ["**/test/javascript/**/?(*.)+(test).ts?(x)"],
  moduleNameMapper: {
    ".+\\.(css|styl|less|sass|scss|png|jpg|ttf|woff|woff2)$": "identity-obj-proxy",
    "@App(.*)$": "<rootDir>/app/javascript/$1",
    "@Components(.*)$": "<rootDir>/app/javascript/components/$1",
    "@Containers(.*)$": "<rootDir>/app/javascript/containers/$1",
    "@Types(.*)$": "<rootDir>/app/javascript/types/$1",
    "@Utils(.*)$": "<rootDir>/app/javascript/utils/$1"
  },
  setupFilesAfterEnv: ["<rootDir>/test/javascript/setup.js"],
  snapshotSerializers: ["enzyme-to-json/serializer"]
}
