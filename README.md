## Welcome to the edb-benchmarks repository!

This repository contains workflows for benchmarks that have been previously developed and are ready for execution.

### Getting Started

Benchmarks can be executed through a dedicated Python virtual environment.

Components needed by host:
- `terraform >= 1.3.6`
- `edb-terraform >= 1.5.1`
- `AWSCli`
- `ansible-core`
- `edb-ansible`
- `tpaexec`

### Benchmark folder structure:

Each benchmark should follow the directory structure listed below with a numeric prefix and a step name:

- `00_validate` - Validates the parameters selected for the benchmark execution. **If the validation fails, the entire benchmark fails.**
- `01_provision` - Provisions the infrastructure required for executing the benchmark
- `02_deploy` - Sets up and configures the provisioned infrastructure
- `03_prepare` - Prepares and sets up the benchmark execution
- `04_execute` - Executes the benchmark
- `05_push_results` - Uploads the results from the benchmark into AWS S3 Bucket
- `06_unprovision` - Destroys the previously provisioned infrastructure

**Each directory contains a `run.sh` script file that executes the ansible playbooks required for the benchmark**

### Executing a benchmark by hand

Clone the repo to a local machine.

```console
$ git clone https://github.com/EnterpriseDB/edb-benchmarks.git
```

From the terminal, set environment variables required by the cloud service provider.

If desired, make changes to the type or size of the database by editing the environment file: `environment.sh`.

Source the environment file.

`source <benchmark-directory>/environment.sh`

Execute `<benchmark-directory>/00_validate/run.sh`

Execute `<benchmark-directory>/01_provision/run.sh`

Wait for the 'Apply Complete' success message.

Execute `<benchmark-directory>/02_deploy/run.sh`

If desired, export additional environment variables manually. 

Execute `<benchmark-directory>/03_prepare/run.sh`

Execute `<benchmark-directory>/04_provision/run.sh`

When ready to terminate the instance, execute `<benchmark-directory>/06_unprovision/run.sh`

### Contributing:

We welcome contributions! If you have benchmarks that you would like to share follow the steps below:

- Simply fork this repository
- Add your benchmarks
- Submit a pull request. 

**Please ensure that the code is well-documented and follows our Guidelines below.**

### Guidelines:

When submitting benchmarks, please follow these guidelines:

- Use clear and concise names for the benchmark files and directories
- Include a `README.md` file in the main directory. The file content should explain: 
  - What the benchmark does
  - How to run it
  - Relevant details related to the benchmark
  - Make sure that the benchmarks are reproducible

### License

The license is available [here](LICENSE.md)
