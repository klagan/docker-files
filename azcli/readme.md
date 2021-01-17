# Getting started

This container should allow you to call up an `az cli` docker backed bash shell logged into your AZ account.  This is useful when you work between different accounts and paranoid about executing against the wrong account.  The account is shown in the prompt to make it obvious which account you will action.

> this process relies on a naming and convention.  the certificate name and the environment file must have the same name (not extension)

---

Create a service principal with certificate (will need to be logged into AZ with appropriate access):

```bash
certName=myname
vaultName=myvault

# create a service principal call "certName" and local certifcate in correct format
sp=$(az ad sp create-for-rbac --name $certName --create-cert -o json)

# upload the local certificate into the remote vault with the name "certName"
az keyvault certificate import --vault-name $vaultName -n $certName -f $(echo $sp | jq -r ".fileWithCertAndPrivateKey")

# example of how to login manually
# echo az login --service-principal --username $(echo $sp | jq -r ".appId") --tenant $(echo $sp | jq -r ".tenant") --password $(echo $sp | jq -r ".fileWithCertAndPrivateKey")

# download the certificate from the remote vault to a new name - this tests the certificate was uploaded
az keyvault secret download --name $certName --vault-name $vaultName --file $(echo $certName | tr -d ' ').pem
```

Create an `environment file (<myname>.env)`:

```bash
K_spId=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
K_tenantId=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
K_certFileName=<myname>.pem
```

If we have used the same name for the environment and certificate files, then following command is an example of how to start the image:

```bash
docker run -it --rm -v $(pwd):/var/tmp --env K_az=<myname> kaml/azcli
```

I wrapped this in a shell script so we can instead call:

```bash
./azcli.sh <myname>
```

## Docker Compose

The sample `docker-compose-sample.yml` allows you to spin up multiple containers for different accounts.  This allows you to `docker attach` to the containers in the ad-hoc or `docker attach` to each container in a different terminal window

