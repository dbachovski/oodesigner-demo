namespace: Integrations.AOS_application
flow:
  name: deploy_aos
  workflow:
    - install_postgres:
        do:
          Integrations.demo.aos.software.install_postgres: []
        navigate:
          - FAILURE: on_failure
          - SUCCESS: install_java
    - install_java:
        do:
          Integrations.demo.aos.software.install_java: []
        navigate:
          - FAILURE: on_failure
          - SUCCESS: install_tomcat
    - install_tomcat:
        do:
          Integrations.demo.aos.software.install_tomcat: []
        navigate:
          - FAILURE: on_failure
          - SUCCESS: install_aos
    - install_aos:
        do:
          io.cloudslang.demo.aos.install_aos: []
        navigate:
          - FAILURE: on_failure
          - SUCCESS: SUCCESS
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      install_postgres:
        x: 176
        'y': 136.86666870117188
      install_java:
        x: 320
        'y': 151.36666870117188
      install_tomcat:
        x: 469
        'y': 184.36666870117188
      install_aos:
        x: 610
        'y': 169.36666870117188
        navigate:
          1558b58d-f91e-5d56-fc6a-7bc8a8ff608f:
            targetId: 7d7003e1-45f7-3091-f135-bc5d50463829
            port: SUCCESS
    results:
      SUCCESS:
        7d7003e1-45f7-3091-f135-bc5d50463829:
          x: 806
          'y': 106
