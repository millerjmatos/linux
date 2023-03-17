Grafana é uma plataforma de visualização de dados e análise que permite monitorar e analisar dados de diversas fontes em tempo real. Ele oferece um conjunto de ferramentas gráficas para criar dashboards personalizados e painéis interativos para monitoramento de sistemas, aplicações, redes, bancos de dados e muito mais. O Grafana suporta uma ampla variedade de fontes de dados, incluindo bancos de dados SQL, Prometheus, Elasticsearch, InfluxDB e muitos outros, tornando-o uma ferramenta de análise de dados altamente flexível e customizável.

### Em Rocky Linux 9

    cat /etc/redhat-release
    Rocky Linux release 9.1 (Blue Onyx)

    uname -r
    5.14.0-162.18.1.el9_1.x86_64

Atualizando o sistema:

    dnf makecache --refresh && dnf update -y

Instalando o repositório yum do grafana:

    vim /etc/yum.repos.d/grafana.repo

        [grafana]
        name=grafana
        baseurl=https://rpm.grafana.com
        repo_gpgcheck=1
        enabled=1
        gpgcheck=1
        gpgkey=https://rpm.grafana.com/gpg.key
        sslverify=1
        sslcacert=/etc/pki/tls/certs/ca-bundle.crt

Construindo o cache para o repositório yum:

    dnf makecache

        Is this ok [y/N]: y
        Metadata cache created.

Instalando:

    dnf install -y grafana

Ativando o serviço na inicialização do sistema:

    systemctl enable --now grafana-server

    systemctl status grafana-server

Liberação firewall:

    firewall-cmd --permanent --add-service=grafana

    firewall-cmd --reload

Acesso a console:

    http://server_ip:3000

Credêncial padrão:

    admin
    admin

Trocar a senha!

Para integração com o zabbix:

    grafana-cli plugins install alexanderzobnin-zabbix-app

    systemctl restart grafana-server

Habilitar o plugin na console!