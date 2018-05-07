# servo-skopos
Optune servo driver for Skopos (supports kubernetes, docker and ec2 environments)

NOTE: before using this driver, place a configuration file in yaml format in the file system root directory:
/app.yaml

The file is in the form expected for the output of the '--query' sub-command, plus a 'driver' section listing all of the applications model and environment files (these should be exactly the files that are normally used to load and deploy the app with Skopos). Each declared setting should match a replacement variable in the model, in the form "$component_setting". The presence of the replacement is not checked for - if there isn't any, the setting will have no effect on the application. Each of the 'value' fields listed in the config file is a default, assumed to be used if the application is deployed *only* with the model and TED files given in the 'driver' section.

An example config file is provided below.


```
driver:
  skopos:
     model: /root/example-twotier-app/skopos-ec2/model-v2.yaml
     teds:
       - /root/skopos/tst/docker.ted

components:
  back:
     settings:
        mem: { min: 1, max: 100, value: 20 }
        cpu: { min: 10, max: 100, value: 30 }
  front:
     settings:
        mem: { min: 1, max: 100, value: 40 }
        cpu: { min: 10, max: 100, value: 50 }
        cache: { type: enum, values: [false, true], value: false }
```

The `test` directory provides a simple 2-tier application that can be used to verify operation of the servo and driver.