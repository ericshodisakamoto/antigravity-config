# Descrição: Bloqueio automático de IPs que tentam fazer muitas conexões TCP (Blacklist por limite de conexões)
# Pré-requisitos: firewall habilitado, lista de bloqueio criada ("blacklist")

/ip firewall filter
add chain=input protocol=tcp connection-limit=30,32 action=add-src-to-address-list address-list=blacklist address-list-timeout=1d comment="Bloqueio automático"

/ip firewall filter
add chain=input src-address-list=blacklist action=drop comment="Drop blacklist"
