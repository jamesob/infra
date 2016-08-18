
# Installing

```
curl -o bootstrap_salt.sh -L https://bootstrap.saltstack.com
sudo sh bootstrap_salt.sh git develop
```


# Running

```
sudo salt-call --local state.apply
```
