# Getting started

This container should allow you to call up an `az cli` docker backed bash shell logged into your AZ account.  This is useful when you work between different accounts and paranoid about executing against the wrong account.  The account is shown in the prompt to make it obvious which account you will action.

> this process relies on a naming and convention.  the certificate name and the environment file must have the same name (not extension)

---

Create a service principal with certificate (will need to be logged into AZ with appropriate access):

```bash
# creates service principal
# creates environment file (.env)
# creates service principal certificate (.pem)
# presents a sample (working) docker-compose.yml
./create_connection_config.sh <new service principal name> <vault name>
```

## Docker Compose

The sample `docker-compose-sample.yml` allows you to spin up multiple containers for different accounts.  You may add multiple sections into the same `docker-compose` file.  This will allow you to create multiple connections at the same time.
This allows you to `docker attach` to the containers in the ad-hoc or `docker attach` to each container in a different terminal window

### Spin up containers

```dockercli
# spin up the different azcli connections by section
docker-compose up -d

# sample output
klagan@ubuntu:~/source/github/docker-files/azcli$ docker-compose up -d
Creating network "azcli_default" with the default driver
Creating myclient    ... done
Creating laganlabs ... done
Creating kamltest  ... done

klagan@ubuntu:~$ docker ps -a
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
c620824f6ee9        local/azcli         "./login.sh"        2 minutes ago       Up 2 minutes                            laganlabs
903a6110065d        local/azcli         "./login.sh"        2 minutes ago       Up 2 minutes                            kamltest
4c4eac923988        local/azcli         "./login.sh"        2 minutes ago       Up 2 minutes                            myclient
```

### Access connection

Now we can connect to the instances as follows (sensitive information is obfuscated):

```dockercli
klagan@ubuntu:~$ docker attach laganlabs
laganLabs.pem >az account list
[
  {
    "cloudName": "AzureCloud",
    "homeTenantId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "isDefault": true,
    "managedByTenants": [],
    "name": "My PAYG",
    "state": "Enabled",
    "tenantId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "user": {
      "name": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
      "type": "servicePrincipal"
    }
  }
]
laganLabs.pem >
```

We can use `CTRL+P`, `CTRL+Q` to exit the container without closing the connection.

### Shutdown connections

```dockercli

# shutdown containers
klagan@ubuntu:~$ docker-compose down
Stopping laganlabs ... done
Stopping kamltest  ... done
Stopping myclient    ... done
Removing laganlabs ... done
Removing kamltest  ... done
Removing myclient    ... done
Removing network azcli_default

# verify containers closed
klagan@ubuntu:~$ docker ps -a
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
klagan@ubuntu:~$ 
```