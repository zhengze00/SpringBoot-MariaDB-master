# 使用官方的 OpenJDK 镜像作为基础镜像
FROM openjdk:17-slim

# 将 JAR 文件添加到镜像中
COPY target/backend5-0.0.1-SNAPSHOT.jar /app/backend5.jar

# 设置工作目录
WORKDIR /app

# 运行 JAR 文件
ENTRYPOINT ["java", "-jar", "backend5.jar"]
