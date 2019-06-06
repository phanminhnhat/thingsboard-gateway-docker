# Thingsboard Gateway Docker Image

# Deploy container
- git clone https://github.com/phanminhnhat/thingsboard-gateway-docker.git
- cd thingsboard-gateway-docker
- Deploy container using one of solutions below:
  - Option 1 : sudo ./docker-run.sh
  - Option 2 (Fresh data): sudo docker run -d -v ~/.mytb-gateway-data:/etc/tb-gateway/conf -v ~/.mytb-gateway-logs:/var/log/tb-gateway/ --name tb-gateway-instance pmnhat/thingsboard-gateway --entrypoint "/run-application.sh"
  - Option 3 (Using config file from this source code): 
    - Edit acccess token inside docker-compose.yml
    - Run "docker-compose up".
- Modify config on ~/.mytb-gateway-data of host machines
- View log on ~/.mytb-gateway-logs

# Build docker image
- Run "sudo ./docker-build.sh"
- Note: Edit the .deb link inside docker file if there are new builds of gateway

# Build and push docker image

- make push
- Note: 
  - If there are new thingsboard build need to update the new link of deb file inside the dockerfile
  - Need to change user if you want to push to your docker hub
  - <details><summary>CLICK FOR DETAIL OUTPUT</summary>
    <p>
    ```
    [root@has thingsboard-gateway-docker]# docker-compose up
    Creating network "thingsboard-gateway-docker_default" with the default driver
    Pulling tb-gateway (pmnhat/thingsboard-gateway:latest)...
    latest: Pulling from pmnhat/thingsboard-gateway
    84d5a83c37ca: Pull complete
    ......
    af93aa51a964: Pull complete
    Digest: sha256:496e8f6dd16e1a386f8e7eee2bed6f5315f94317e8049620f33a8781e19dd548
    Status: Downloaded newer image for pmnhat/thingsboard-gateway:latest
    Creating thingsboard-gateway-docker_tb-gateway_1 ... done
    Attaching to thingsboard-gateway-docker_tb-gateway_1
    tb-gateway_1  | '/tmp/tb-gateway/conf/banner.txt' -> '/etc/tb-gateway/conf/banner.txt'
    tb-gateway_1  | removed '/tmp/tb-gateway/conf/banner.txt'
    ........
    tb-gateway_1  | '/tmp/tb-gateway/conf/tb-gateway.yml' -> '/etc/tb-gateway/conf/tb-gateway.yml'
    tb-gateway_1  | removed '/tmp/tb-gateway/conf/tb-gateway.yml'
    tb-gateway_1  | export LANG='C.UTF-8'
    ........
    tb-gateway_1  | export _='/usr/bin/printenv'
    tb-gateway_1  | Starting 'TB-gateway' service...
    tb-gateway_1  | Started [40]
    tb-gateway_1  | 06:06:52,206 |-WARN in ch.qos.logback.core.ConsoleAppender[STDOUT] - To ensure compatibility, wrapping your layout in LayoutWrappingEncoder.
    tb-gateway_1  | 06:06:52,206 |-WARN in ch.qos.logback.core.ConsoleAppender[STDOUT] - See also http://logback.qos.ch/codes.html#layoutInsteadOfEncoder for details
    tb-gateway_1  | 06:06:52,208 |-INFO in ch.qos.logback.classic.joran.action.LoggerAction - Setting level of logger [org.thingsboard] to INFO
    tb-gateway_1  | 06:06:52,208 |-INFO in ch.qos.logback.classic.joran.action.LoggerAction - Setting level of logger [org.eclipse.milo] to INFO
    tb-gateway_1  | 06:06:52,208 |-INFO in ch.qos.logback.classic.joran.action.LoggerAction - Setting level of logger [org.eclipse.paho] to INFO
    tb-gateway_1  | 06:06:52,208 |-INFO in ch.qos.logback.classic.joran.action.RootLoggerAction - Setting level of ROOT logger to INFO
    tb-gateway_1  | 06:06:52,208 |-INFO in ch.qos.logback.core.joran.action.AppenderRefAction - Attaching appender named [STDOUT] to Logger[ROOT]
    tb-gateway_1  | 06:06:52,209 |-INFO in ch.qos.logback.classic.joran.action.ConfigurationAction - End of configuration.
    tb-gateway_1  | 06:06:52,210 |-INFO in ch.qos.logback.classic.joran.JoranConfigurator@7cca494b - Registering current configuration as safe fallback point
    tb-gateway_1  | 
    tb-gateway_1  |  ===================================================
    tb-gateway_1  |  :: Thingsboard Gateway ::       (v2.2.1-SNAPSHOT)
    tb-gateway_1  |  ===================================================
    tb-gateway_1  | 
    tb-gateway_1  | 06:06:54.771 [main] INFO  o.t.gateway.GatewayApplication - Starting GatewayApplication v2.2.1-SNAPSHOT on da8dd8eb3cbe with PID 40 (/usr/share/tb-gateway/bin/tb-gateway.jar started by thingsboard in /usr/share/tb-gateway/bin)
    tb-gateway_1  | 06:06:54.783 [main] INFO  o.t.gateway.GatewayApplication - No active profile set, falling back to default profiles: default
    tb-gateway_1  | 06:06:55.068 [main] INFO  o.s.b.c.e.AnnotationConfigEmbeddedWebApplicationContext - Refreshing org.springframework.boot.context.embedded.AnnotationConfigEmbeddedWebApplicationContext@7a92922: startup date [Thu Jun 06 06:06:54 UTC 2019]; root of context hierarchy
    tb-gateway_1  | 06:06:56.750 [background-preinit] INFO  o.h.validator.internal.util.Version - HV000001: Hibernate Validator 5.2.4.Final
    tb-gateway_1  | 06:06:58.327 [main] INFO  o.s.b.f.config.PropertiesFactoryBean - Loading properties file from URL [jar:file:/usr/share/tb-gateway/bin/tb-gateway.jar!/BOOT-INF/lib/spring-integration-core-4.3.6.RELEASE.jar!/META-INF/spring.integration.default.properties]
    tb-gateway_1  | 06:06:58.333 [main] INFO  o.s.i.config.IntegrationRegistrar - No bean named 'integrationHeaderChannelRegistry' has been explicitly defined. Therefore, a default DefaultHeaderChannelRegistry will be created.
    tb-gateway_1  | 06:06:58.806 [main] INFO  o.s.i.c.DefaultConfiguringBeanFactoryPostProcessor - No bean named 'errorChannel' has been explicitly defined. Therefore, a default PublishSubscribeChannel will be created.
    tb-gateway_1  | 06:06:58.822 [main] INFO  o.s.i.c.DefaultConfiguringBeanFactoryPostProcessor - No bean named 'taskScheduler' has been explicitly defined. Therefore, a default ThreadPoolTaskScheduler will be created.
    tb-gateway_1  | 06:06:59.267 [main] INFO  o.s.c.s.PostProcessorRegistrationDelegate$BeanPostProcessorChecker - Bean 'org.springframework.transaction.annotation.ProxyTransactionManagementConfiguration' of type [class org.springframework.transaction.annotation.ProxyTransactionManagementConfiguration$$EnhancerBySpringCGLIB$$77cf10bc] is not eligible for getting processed by all BeanPostProcessors (for example: not eligible for auto-proxying)
    tb-gateway_1  | 06:06:59.522 [main] INFO  o.s.b.f.config.PropertiesFactoryBean - Loading properties file from URL [jar:file:/usr/share/tb-gateway/bin/tb-gateway.jar!/BOOT-INF/lib/spring-integration-core-4.3.6.RELEASE.jar!/META-INF/spring.integration.default.properties]
    tb-gateway_1  | 06:06:59.523 [main] INFO  o.s.c.s.PostProcessorRegistrationDelegate$BeanPostProcessorChecker - Bean 'integrationGlobalProperties' of type [class org.springframework.beans.factory.config.PropertiesFactoryBean] is not eligible for getting processed by all BeanPostProcessors (for example: not eligible for auto-proxying)
    tb-gateway_1  | 06:06:59.524 [main] INFO  o.s.c.s.PostProcessorRegistrationDelegate$BeanPostProcessorChecker - Bean 'integrationGlobalProperties' of type [class java.util.Properties] is not eligible for getting processed by all BeanPostProcessors (for example: not eligible for auto-proxying)
    tb-gateway_1  | 06:07:01.015 [main] INFO  o.s.b.c.e.t.TomcatEmbeddedServletContainer - Tomcat initialized with port(s): 9090 (http)
    tb-gateway_1  | 06:07:01.095 [main] INFO  o.a.catalina.core.StandardService - Starting service Tomcat
    tb-gateway_1  | 06:07:01.096 [main] INFO  o.a.catalina.core.StandardEngine - Starting Servlet Engine: Apache Tomcat/8.5.6
    tb-gateway_1  | 06:07:02.384 [localhost-startStop-1] INFO  o.a.c.c.C.[Tomcat].[localhost].[/] - Initializing Spring embedded WebApplicationContext
    tb-gateway_1  | 06:07:02.385 [localhost-startStop-1] INFO  o.s.web.context.ContextLoader - Root WebApplicationContext: initialization completed in 7414 ms
    tb-gateway_1  | 06:07:02.928 [localhost-startStop-1] INFO  o.s.b.w.s.ServletRegistrationBean - Mapping servlet: 'dispatcherServlet' to [/]
    tb-gateway_1  | 06:07:02.937 [localhost-startStop-1] INFO  o.s.b.w.s.FilterRegistrationBean - Mapping filter: 'characterEncodingFilter' to: [/*]
    tb-gateway_1  | 06:07:03.006 [localhost-startStop-1] INFO  o.s.b.w.s.FilterRegistrationBean - Mapping filter: 'hiddenHttpMethodFilter' to: [/*]
    tb-gateway_1  | 06:07:03.006 [localhost-startStop-1] INFO  o.s.b.w.s.FilterRegistrationBean - Mapping filter: 'httpPutFormContentFilter' to: [/*]
    tb-gateway_1  | 06:07:03.006 [localhost-startStop-1] INFO  o.s.b.w.s.FilterRegistrationBean - Mapping filter: 'requestContextFilter' to: [/*]
    tb-gateway_1  | 06:07:03.700 [main] INFO  o.t.g.s.DefaultTenantManagerService - [Tenant] Initializing gateway
    tb-gateway_1  | 06:07:16.224 [pool-4-thread-1] INFO  o.t.g.s.gateway.MqttGatewayService - Gateway statistics {"ts":1559801234857,"values":{"devicesOnline":0,"attributesUploaded":0,"telemetryUploaded":0}} reported!
    ```
    </p>
    </details> 
