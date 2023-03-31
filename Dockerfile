# 创建一个小镜像以传递
FROM debian:stretch-slim

# 拷贝基础配置设定
COPY config.yaml .

# 将可执行文件复制到小镜像中
COPY app-test .

# 声明服务器端口
EXPOSE 8088

# 赋予运行权限
RUN chmod +x ./app-test

# 添加证书访问gtp
RUN apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends ca-certificates curl

# 需要运行的命令
ENTRYPOINT [ "./app-test", "config.yaml" ]
