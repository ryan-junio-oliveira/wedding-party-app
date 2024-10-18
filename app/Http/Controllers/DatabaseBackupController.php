<?php

namespace App\Http\Controllers;

class DatabaseBackupController extends Controller
{
    public function backup()
    {
        try {
            $databasePath = database_path('database.sqlite');
            $backupFileName = 'backup_' . date('d-m-Y_H-i-s') . '.sql';

            // Cria o diretório de backup se não existir
            $backupDir = database_path('backup');
            if (!file_exists($backupDir)) {
                mkdir($backupDir, 0755, true);
            }

            // Caminho do backup anterior
            $previousBackupPath = $backupDir . '/' . 'backup_latest.sql';

            // Exclui o backup anterior, se existir
            if (file_exists($previousBackupPath)) {
                unlink($previousBackupPath);
            }

            // Caminho do novo backup
            $newBackupPath = $backupDir . '/' . $backupFileName;
            $command = "sqlite3 \"$databasePath\" .dump > \"$newBackupPath\"";

            $output = [];
            $returnVar = 0;
            exec($command, $output, $returnVar);

            if ($returnVar !== 0) {
                return response()->json(['message' => 'Erro ao executar o comando: ' . implode("\n", $output)], 500);
            }
            
            rename($newBackupPath, $previousBackupPath);

            return response()->download($previousBackupPath);
        } catch (\Throwable $th) {
            return response()->json(['message' => 'Falha ao criar o backup.'], 500);
        }
    }
}
