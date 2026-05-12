# Melhores Práticas para RouterOS

## Scripts de Firewall
- **Input Chain**: Sempre proteja o roteador contra acessos não autorizados.
- **Forward Chain**: Bloqueie o tráfego não explicitamente permitido se necessário.
- **Address Lists**: Utilize listas de endereços para gerenciamento dinâmico e melhor desempenho.

## QoS e Bandwidth Management
- Utilize `simple queues` para controle de largura de banda simples.
- Use `queue tree` para controles complexos de priorização.
- Mantenha a utilização de CPU baixa ao usar QoS.

## Load Balance (PCC)
- O `PCC` (Per Connection Classifier) é a forma recomendada para balanceamento de conexões mantendo estados.
- Use `mangle` para marcar conexões e roteamento.

## Segurança
- Sempre desative serviços desnecessários (`/ip service`).
- Use senhas fortes e evite logins de administrador genéricos.
- Considere o uso de `Safe Mode` ao realizar alterações remotas.
