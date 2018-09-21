# qing-hyperledger

## File list 
    - bin: metadata tool.
    - confd: configutration file folder used by confd.
    - config: qingcloud appcenter config file folder. upload this folder as a compressed file when build a app.
    - deploy-tool: Hyperledger-fabric deploy tool, see `deploy-tool/README.md` for more detail.
    - scripts: storage scripts.
    - services: few scripts executed at the lifecyle of the app. see `config/cluster.json.mustache` for more detail.

## How to build kvm image

    - apply a instance on qingcloud and exec all command in `init-kvm.sh`, I comment all of the commands since it will be better to exec line by line.
    - copying `confd` into `/etc/confd/` in order to get the user config