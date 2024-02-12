O Apache Tomcat é um servidor de aplicação web de código aberto que implementa as tecnologias Java Servlet e JavaServer Pages (JSP), permitindo que aplicativos web baseados em Java sejam executados e gerenciados. Ele atua como um contêiner que recebe solicitações web, as processa e entrega as respostas aos clientes, sendo amplamente utilizado para hospedar aplicativos web Java.

#### Instalação

No Ubuntu e derivados:

    sudo apt install default-jdk

Download: https://tomcat.apache.org/

    cd /tmp/

    wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.15/bin/apache-tomcat-10.1.15.tar.gz

    tar -xvzf apache-tomcat-X.Y.Z.tar.gz

    sudo mv apache-tomcat-10.1.15 /opt/tomcat

Facilitando a utilização com variáveis de ambiente:

    vim ~/.bashrc

        export CATALINA_HOME=/opt/tomcat
        export CATALINA_BASE=/opt/tomcat
        export CATALINA_OPTS="-Xms512M -Xmx1024M -server -XX:+UseParallelGC"

    :x

    source ~/.bashrc

Iniciando:

    cd /opt/tomcat/bin/
    
    .startup.sh

Parando:

    .shutdown.sh


#### Arquivos de configuração:

Geralmente em:

    /opt/tomcat/

**server.xml**: Este arquivo contém a configuração do servidor Tomcat, incluindo portas de conexão, configurações de SSL, configuração do conector HTTP, configuração do banco de dados de recursos, entre outros.

_**Conectores (Connectors)**: Essa seção define os conectores que o Tomcat usará para receber solicitações HTTP. Os conectores mais comuns são o conector HTTP (HTTP Connector) e o conector HTTPS (HTTPS Connector), que permitem que o Tomcat aceite solicitações HTTP e HTTPS, respectivamente. Aqui, você pode especificar portas, protocolos, certificados SSL, configurações de compressão, entre outros.

_**Hosts**: A seção "Host" define os hosts virtuais (virtual hosts) suportados pelo servidor Tomcat. Aqui, você pode definir o nome do host, o diretório base do aplicativo e outras configurações específicas do host.

_**Contextos (Contexts)**: Esta seção define os contextos de implantação dos aplicativos da web. Cada aplicativo da web implantado no Tomcat possui um contexto associado que define o nome do contexto, o diretório base do aplicativo, as configurações de sessão, as configurações de segurança e outras configurações específicas do contexto.

_**Bancos de dados (Data Sources)**: Aqui, você pode configurar bancos de dados e recursos JNDI (Java Naming and Directory Interface) que os aplicativos da web podem usar para se conectar a bancos de dados externos.

_**Configurações de segurança**: A seção de configurações de segurança permite que você defina restrições de acesso a recursos, autenticação e autorização para os aplicativos da web implantados.

**web.xml**: Este arquivo está localizado dentro do diretório de cada aplicativo da web implantado no Tomcat (geralmente em "/var/lib/tomcat/webapps/[nome_do_aplicativo]/WEB-INF/web.xml"). Ele contém configurações específicas do aplicativo, como mapeamentos de URL, configurações de servlets, filtros e outros parâmetros de inicialização.

**context.xml**: Este arquivo também está localizado dentro do diretório de cada aplicativo da web e é usado para definir configurações específicas do contexto de implantação do aplicativo, como configurações de banco de dados, configurações de segurança e outras configurações de ambiente.

**catalina.policy**: Este arquivo define as permissões de segurança para aplicativos implantados no Tomcat. Ele controla quais operações um aplicativo tem permissão para executar e quais recursos ele pode acessar.

**catalina.properties**: Este arquivo contém várias configurações de propriedades do Tomcat, como diretórios de log, diretórios de trabalho, configurações de cache, configurações de classpath, entre outros.

**logging.properties**: Este arquivo especifica as configurações de registro (log) do Tomcat, como o nível de log, o formato do log e os arquivos de log a serem usados.