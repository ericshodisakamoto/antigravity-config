# --- MIKROTIK SCRIPT: AUTO BACKUP + SCHEDULER ---
# Author: Antigravity Assistant
# Description: Gera backup binário e exportação de configuração (.rsc) diariamente.
# Compatibility: v6 and v7

:local identity [/system identity get name];
:local date [/system clock get date];
:local time [/system clock get time];

# Formatar data para YYYY-MM-DD
:local months ("jan","feb","mar","apr","may","jun","jul","aug","sep","oct","nov","dec");
:local day [:pick $date 4 6];
:local month [:pick $date 0 3];
:local year [:pick $date 7 11];
:local mNum [:find $months $month];
:set mNum ($mNum + 1);
:if ($mNum < 10) do={ :set mNum ("0" . $mNum) };
:local fDate ("$year-$mNum-$day");

# Formatar hora para HH-MM-SS
:local fTime ([:pick $time 0 2] . "-" . [:pick $time 3 5] . "-" . [:pick $time 6 8]);

:local fileName ("Backup-$identity-$fDate-$fTime");

:log info "Gerando backup diário: $fileName";

# Salvar Backup Binário
/system backup save name=$fileName;

# Salvar Exportação de Configuração (.rsc)
/export file=$fileName;

:log info "Backup diário concluído com sucesso: $fileName";

# --- AGENDADOR (SCHEDULER) ---
# Caso queira adicionar via script, rode as linhas abaixo no terminal uma única vez:
# /system script add name=DailyBackupScript source=[/system script get [find name=daily_backup] source]
# /system scheduler add name=DailyBackupSched interval=1d on-event=DailyBackupScript start-time=03:00:00
