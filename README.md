# README

What is everscale dapp and how it works you can read [here](https://github.com/tonlabs/evernode-ds)
Simple HOWTO about deploying EVER OS DApp Server via ansible

Ansible must be >= 2.9

Destination OS can be
 - Oracle Linux 8
 - CentOS 8
 
Ubuntu 21, 20, 18, 16, 14 not yet tested. But you can help our team to test it by yourself.

# Getting Started

First of all you need A-record for your dapp. Also you have to create DNS records if you want to manage kafka/arangodb, pointed to the same IP:

<pre><code>
dapp.company.example                IN A   123.45.67.8
kafka-ui.dapp.company.example       IN A   123.45.67.8
arangodb.dapp.company.example       IN A   123.45.67.8
</code></pre>

Second - change ```vars/vars-*.yaml``` and ```inventory/hosts.yaml```

Inventory file should have correct A-record and IP in **dapp** section
For example:

<pre><code>
[all:vars]
ansible_ssh_common_args='-o StrictHostKeyChecking=no'

[dapp]
dapp.company.example ansible_host=123.45.67.8

[dapp:vars]
serviceName=dapp
</code></pre>

Third:
```ansible-playbook -i inventory/hosts.yaml -v main.yaml```

After installing you have to wait some time for everscale node sync. After everscale node sync process is completed you can open you personal dapp: https://dapp.company.example/graphql

# Problems and solutions

## Re-Deploy

When you want redeploy DApp, you need clear kafka volume

 - ```docker stop kafka``` ( or do it via docker-compose from directory with kafka docker-compose.yaml: docker-compose down -v )
 - ```docker volume prune```

# Support

[Russian telegram group](https://t.me/itgoldio_support_ru)

[English telegram group](https://t.me/tgoldio_support_en)
