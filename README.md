# servo-skopos
Optune servo driver for Skopos (supports kubernetes, docker and ec2 environments)

NOTE: before using this driver, place a configuration file named `config.yaml` in yaml format in the same directory as the driver.

The file is in the form expected for the output of the '--query' sub-command, plus a listing all of the applications model and environment files (these should be exactly the files that are normally used to load and deploy the app with Skopos). Each declared setting should match a replacement variable in the model, in the form "$component_setting". The presence of the replacement is not checked for - if there isn't any, the setting will have no effect on the application. Each of the 'value' fields listed in the config file is a default, assumed to be used if the application is deployed *only* with the model and TED files given in the 'driver' section.

An example config file is provided below.


```
skopos:
  force_replace: False
  skopos_addr: "example.com:8100"
  model: skopos/model.yaml
  teds:
    - skopos/profile.yaml
    - skopos/env.yaml
    - skopos/env2yaml
    - skopos/region.yaml

  components:
    front:
      settings:
        # 'value' will be used for --query if it cannot be retrieved from skopos
        type: { type: enum, value: 'c4.2xlarge' }
    back:
      settings:
        # 'value' will be used for --query if it cannot be retrieved from skopos
        type: { type: enum, value: 'm4.xlarge' }

```

The `test` directory provides a simple 2-tier application that can be used to verify operation of the servo and driver.
