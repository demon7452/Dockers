# 构建镜像
`bash
docker build -t springboot:v2 .
`

# 创建容器启动bash
## 其中，-t 选项让Docker分配一个伪终端（pseudo-tty）并绑定到容器的标准输入上，
## -i 则让容器的标准输入保持打开。
`bash
docker run -i -t -p 8080:8080 springboot:v2
`
# 进入容器
## alpine镜像需要使用 /bin/sh 进入容器
`bash
docker exec -it 00b /bin/sh
`
