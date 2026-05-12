# Guia de Backup Diário Automático

Este sistema automatiza a criação de dois tipos de backup no MikroTik:
1.  **Backup Binário (.backup)**: Cópia completa do sistema para restauração no mesmo equipamento.
2.  **Exportação (.rsc)**: Arquivo de texto legível com todos os comandos de configuração, ideal para migrações ou revisões.

### Como Implementar

1.  **Criar o Script**:
    - Vá em `System` -> `Scripts`.
    - Adicione um novo script chamado `DailyBackupScript`.
    - Cole o conteúdo do arquivo `daily_backup.rsc`.

2.  **Agendar a Execução**:
    - Vá em `System` -> `Scheduler`.
    - Adicione um novo agendamento:
        - **Name**: `DailyBackup`
        - **Start Time**: `03:00:00` (Recomendado madrugada)
        - **Interval**: `1d` (Ou `24:00:00`)
        - **On Event**: `DailyBackupScript`

### Melhores Práticas
- **Monitoramento de Espaço**: Certifique-se de que a memória flash do roteador tem espaço suficiente. Roteadores com 16MB de flash podem lotar rapidamente.
- **Off-site Backup**: Considere enviar esses arquivos para um servidor externo via FTP ou E-mail para maior segurança.
