# EDB Benchmarking Automation Center
## AWS DBT2 Aurora

AWS DBT2 Aurora is a project that provides benchmark data for DBT2 Aurora on Amazon Web Services (AWS).

### Dependencies

- `terraform >= 1.3.6`
- `edb-terraform >= 1.0.0`
- `ansible`
- `edb-ansible`
- `AWS CLI`

### Getting Started

This benchmark can be run on a machine with Python installed, or within a Python virtual environment.

Clone the repo to a local machine.

```console
$ git clone https://github.com/EnterpriseDB/edb-benchmarks.git
```

### Executing a benchmark by hand

Open the terminal from your local machine or from within a virtual environment.

Copy your AWS credentials and paste them into the terminal. They can be found in the Command Line or Programmatic Access menu, under Option 1: Set AWS environment variables (Short-term credentials). This will add the following credentials to your environment as export variables:

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_SESSION_TOKEN`

From terminal, cd into <your-file-path/edb-benchmarks/aws-dbt2-aurora>.

If desired, make changes to the type or size of the database by editing the [environment file](environment.sh) .

From terminal, cd into 00_validate and run the script:

```console
$ ./run.sh
```

cd into 01_provision and run the script.

Wait for the 'Apply Complete' success message.

cd into 02_deploy and run the script.

cd into 03_prepare and run the script. If desired, adjust parameters as needed before running.

Example (change number of warehouses to one):

```console
$ export DBT2_WAREHOUSE=1
$ ./run.sh
```

cd into 04_execute and run the script.

When ready to terminate the instance, cd into 06_unprovision and run the script.
