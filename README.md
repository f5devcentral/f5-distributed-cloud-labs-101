# F5 Distributed Cloud 101 (formerly Volterra)

## Overview

This Lab environment highlights some of the basic concepts of F5 Distributed Cloud.

The main UDF blueprint is:

Distributed Cloud Lab 101
https://udf.f5.com/b/0eb04e3f-13db-445c-846e-513afa954333 (Limited to F5 employees at this time)

This can also be adapted to run outside of UDF (requires Distributed Cloud Mesh node and [Single-Page Application Demo](https://github.com/f5devcentral/spa-demo-app) and a VoltStack node in another site)

## Lab Guide

Please see the `docs` directory in the `networking`, `application`, or `security` directories.

## Development
Please run the following commands to setup a development environment:
```bash
python3 -m venv venv
source ./venv/bin/activate
cd ./application/docs/
pip install -r requirements.txt
```

To build the documentation
```bash
cd ./application/docs
make html
```

## Support
For support, please open a GitHub issue.  Note, the code in this repository is community supported and is not supported by F5 Networks.  For a complete list of supported projects please reference [SUPPORT.md](SUPPORT.md).

## Community Code of Conduct
Please refer to the [F5 DevCentral Community Code of Conduct](code_of_conduct.md).


## License
[Apache License 2.0](LICENSE)

## Copyright
Copyright 2014-2021 F5 Networks Inc.


### F5 Networks Contributor License Agreement

Before you start contributing to any project sponsored by F5 Networks, Inc. (F5) on GitHub, you will need to sign a Contributor License Agreement (CLA).

If you are signing as an individual, we recommend that you talk to your employer (if applicable) before signing the CLA since some employment agreements may have restrictions on your contributions to other projects.
Otherwise by submitting a CLA you represent that you are legally entitled to grant the licenses recited therein.

If your employer has rights to intellectual property that you create, such as your contributions, you represent that you have received permission to make contributions on behalf of that employer, that your employer has waived such rights for your contributions, or that your employer has executed a separate CLA with F5.

If you are signing on behalf of a company, you represent that you are legally entitled to grant the license recited therein.
You represent further that each employee of the entity that submits contributions is authorized to submit such contributions on behalf of the entity pursuant to the CLA.
 
