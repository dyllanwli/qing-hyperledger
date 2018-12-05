# qing-hyperledger

## File list

- bin: metadata tool.
- confd: configutration file folder used by confd.
- config: qingcloud appcenter config file folder. upload this folder as a compressed file when build a app.
- deploy-tool: Hyperledger-fabric deploy tool, see `deploy-tool/README.md` for more detail.
- scripts: storage scripts.
- services: few scripts executed at the lifecyle of the app. see `config/cluster.json.mustache` for more detail.
  - `browser_init.sh` 创建应用的时候初始化浏览器节点的脚本
  - `browser_restart.sh` 浏览器节点重启脚本
  - `browser_start.sh` 浏览器节点启动脚本
  - `browser_stop.sh` 浏览器节点停止脚本
  - `config.js` 用来修改浏览器的配置文件
  - `utils.sh` 查看集群参数功能
  - `work_init.sh` 工作节点初始化脚本
  - `work_start.sh` 工作节点启动脚本
  - `work_stop.sh` 工作节点停止脚本
