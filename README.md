# StreamingFast Tooling
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)


Scripts and commands to setup a new Solana Mindreader

#### Infra 

Solana nodes are gcloud computer instances. We create them via terraform [here](https://github.com/streamingfast/infra-priv/blob/master/dfuseio-global/solana-instances.tf)

### SSH Connection

Retrieving the gcloud instance ip
```bash
gcloud compute instances list
...
solana-mindreader-2                                  us-central1-a  n2d-standard-64                10.0.1.30    34.123.85.44     RUNNING
...
```

Setup your local ssh configuration. Add to `~/.ssh.config` the following config lines
```bash
Host sol2
  HostName <IP-FROM-STEP-ABOVE>
  IdentityFile ~/.ssh/identity.infra.dfuse
```

### New Machine Setups

Run the following commands once SSHed into the machine
```bash
sudo adduser solana
sudo vi /etc/group
// add solana to the `google-sudoers` like so:
// google-sudoers:x:1000:abourget,julien,stepd,colin,maoueh,billettc,solana
sudo su solana
cd ~
git clone https://github.com/streamingfast/solana-mindreader
cd solana-mindreader
./scripts/install.sh

```



