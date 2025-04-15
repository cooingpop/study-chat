# 1단계: Build stage
FROM eclipse-temurin:21 AS builder

WORKDIR /app

# 프로젝트의 Gradle Wrapper나 Maven 사용 여부에 따라 변경
COPY . .

# Gradle 사용하는 경우
RUN ./gradlew clean build -x test

# Maven 사용하는 경우 (주석 해제 후 Gradle 부분은 주석 처리)
# RUN ./mvnw clean package -DskipTests

# 2단계: Runtime stage (Corretto 21 사용)
FROM amazoncorretto:21

# JVM 환경 변수 설정 (필요시 조정)
ENV JAVA_OPTS="-XX:+UseContainerSupport -Djava.security.egd=file:/dev/./urandom"

WORKDIR /app

# 빌드된 jar 파일 복사 (build/libs/*.jar 패턴은 프로젝트에 따라 다를 수 있음)
COPY --from=builder /app/build/libs/*.jar app.jar

# 포트 설정 (Render에서 자동 감지하므로 EXPOSE만 하면 됨)
EXPOSE 8080

# 실행 명령
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]
