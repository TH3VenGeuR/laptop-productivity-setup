# How to use this repo

## Install prerequisites (you'll be ask to manually download some requirements) 

```bash
chmod +x prerequisites.sh
./prerequisites.sh
```

## Then run the playbook

```bash
ansible-playbook playbook/productivity.yml -i inventory/default.ini -k -b --ask-become-pass -v
```

