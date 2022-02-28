module.exports = {
  compilers: {
    solc: {
      version: "^0.8.7",
      settings: {
        optimizer: {
          enabled: true,
          runs: 200
        }
      }
    }
  },
  mocha: {
    useColors: true,
    reporter: 'mocha-multi-reporters',
    reporterOptions: {
      reporterEnabled: "spec, mocha-junit-reporter",
      mochaJunitReporterReporterOptions: {
        testCaseSwitchClassnameAndName: true,
        mochaFile: "test-results.xml"
      }
    }
  }
};
