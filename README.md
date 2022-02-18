# README

Simple HOWTO about deploying EVER OS DApp Server via ansible

Ansible must be >= 2.9

Destination OS can be
 - Oracle Linux 8
 - Ubuntu 20
 - CentOS

Ubuntu 21, 18, 16, 14 not yet tested

# Getting Started

First of all you need A-record for your dapp.

Second - change ```vars/vars.yaml``` and ```inventory/hosts.yaml```

Inventory file should have correct A-record and IP in **dapp** section

For example:

<code>
[all:vars]
ansible_ssh_common_args='-o StrictHostKeyChecking=no'

[dapp]
dapp.company.io ansible_host=11.194.53.68

[dapp:vars]
serviceName=dapp
</code>

Third:
```ansible-playbook -i inventory/hosts.yaml -v main.yaml```


# Problems and solutions

## Re-Deploy

When you want redeploy DApp, you need clear kafka volume

 - ```docker stop kafka``` ( or do it via docker-compose from directory with kafka docker-compose.yaml )
 - ```docker volume prune```

If your proxy always restarting, look to logs with command; ```docker logs -n200 proxy```

## Problems with proxy

Always restarting proxy-container in ```docker ps``` output and in logs you see errors about problems with hostname

Look deeper - may be you see double quotes or double-double quotes ( ""hostname.domain.tld"" ) near hostname

Solution very simple. Go to proxy docker-compose directory ( for example ```/opt/dapp/``` ) and check environment files and environment variables in docker-compose.yaml-files


# Support

We can help you in telegram chats

    RU: https://t.me/itgoldio_support_ru
    EN: https://t.me/tgoldio_support_en
