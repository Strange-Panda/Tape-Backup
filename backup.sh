#!/bin/bash
### Expecto-Patronum Version 1.04 rev. 202102121024
###
### Tape-Backup using'TAR' & 'MT' for UNIX | 2021 christoph[at]reit-it.de
###
### Copyright (C) 2021  Christoph Reit 
###
### This script is designed to transfer folders from a Linux machine (in this case RedHat) to an LTO tape drive. 
### It uses gzip as compression method. 
### Additionally a logfile is created [/var/log/tape-backup_`date +"%Y-%m-%d_%H-%M"`.log] which lists all backed up data.
###
### This program is free software: you can redistribute it and/or modify
### it under the terms of the GNU General Public License as published by
### the Free Software Foundation, either version 3 of the License, or
### (at your option) any later version.
###
### This program is distributed in the hope that it will be useful,
### but WITHOUT ANY WARRANTY; without even the implied warranty of
### MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
### GNU General Public License for more details.
###
### You should have received a copy of the GNU General Public License
### along with this program.  If not, see <https://www.gnu.org/licenses/>.
###
### /dev/st0 defines the tape-drive
### /backup/folder defines the folder you want to backup. 
###
###
logfile=/var/log/tape-backup_`date +"%Y-%m-%d_%H-%M"`.log
echo " ______              _                       _     ";
echo "(____  \            | |                     | |    ";
echo " ____)  )_____  ____| |  _ _   _ ____    ___| |__  ";
echo "|  __  ((____ |/ ___) |_/ ) | | |  _ \  /___)  _ \ ";
echo "| |__)  ) ___ ( (___|  _ (| |_| | |_| ||___ | | | |";
echo "|______/\_____|\____)_| \_)____/|  __(_|___/|_| |_|";
echo "                                |_|                ";
echo "                                                                                                        ";
echo "Tape-Backup using'TAR' & 'MT' for UNIX | 2021 christoph[at]reit-it.de                                   ";
echo "                                                                                                        ";
echo "                                                                                                        ";
echo "                                                                                                        ";
echo "Go and grab yourself a Coffee or Tea. This will take a while...                                         ";
echo "                                                                                                        ";
echo "                                                                                                        ";

echo "======================================" &>> $logfile

echo `date +%Y-%m-%d_%H:%M:%S` "LOCKING TAPE-DRIVE '/dev/st0'" &>> $logfile
echo `date +%Y-%m-%d_%H:%M:%S` "LOCKING TAPE-DRIVE '/dev/st0'"
mt -f /dev/st0 lock &>> $logfile ### Lock drive

echo `date +%Y-%m-%d_%H:%M:%S` "INITIAL TAPE REWIND" &>> $logfile
echo `date +%Y-%m-%d_%H:%M:%S` "INITIAL TAPE REWIND"

mt -f /dev/st0 rewind &>> $logfile ### Rewind Tape

echo `date +%Y-%m-%d_%H:%M:%S` "STARTING BACKUP >>> /backup/folder" &>> $logfile
echo `date +%Y-%m-%d_%H:%M:%S` "STARTING BACKUP >>> /backup/folder"

tar -czf /dev/st0 /backup/folder ### Starting backup with gzip compression

echo `date +%Y-%m-%d_%H:%M:%S` "WRITE PROCESS DONE" &>> $logfile
echo `date +%Y-%m-%d_%H:%M:%S` "WRITE PROCESS DONE"

echo "BUILDING THE LOGIFLE"

echo `date +%Y-%m-%d_%H:%M:%S` "REWIND FOR READ" &>> $logfile
echo `date +%Y-%m-%d_%H:%M:%S` "REWIND FOR READ"

mt -f /dev/st0 rewind &>> $logfile ### Tape rewind

echo `date +%Y-%m-%d_%H:%M:%S` "STATUS OF '/dev/st0'" &>> $logfile

mt -f /dev/st0 status &>> $logfile ### tell status

echo `date +%Y-%m-%d_%H:%M:%S` "LISTING FILES ON TAPE" >> $logfile

tar -tzf /dev/st0 &>> $logfile ### post all backed-up files to the logfile

echo `date +%Y-%m-%d_%H:%M:%S` "FINAL REWIND" &>> $logfile

mt -f /dev/st0 rewind &>> $logfile ### Final Rewind
echo `date +%Y-%m-%d_%H:%M:%S` "Tape Unlock" &>> $logfile

mt -f /dev/st0 unlock &>> $logfile ### unlock drive
echo "TAPE UNLOCKED
echo `date +%Y-%m-%d_%H:%M:%S` "Tape Unload" &>> $logfile

mt -f /dev/st0 offline &>> $logfile ### remove tape from drive
echo "TAPE UNLOADED"
echo `date +%Y-%m-%d_%H:%M:%S` "BACKUP OF '/backup/folder' DONE" >> $logfile
echo "                                                              ";
echo "                                                              ";
echo "                                                              ";
echo " ____    _    ____ _  ___   _ ____    ____   ___  _   _ _____ ";
echo "| __ )  / \  / ___| |/ | | | |  _ \  |  _ \ / _ \| \ | | ____|";
echo "|  _ \ / _ \| |   | ' /| | | | |_) | | | | | | | |  \| |  _|  ";
echo "| |_) / ___ | |___| . \| |_| |  __/  | |_| | |_| | |\  | |___ ";
echo "|____/_/   \_\____|_|\_\\___/|_|     |____/ \___/|_| \_|_____|";
echo "==============================================================";
echo `date +%Y-%m-%d_%H:%M:%S`"                                     ";
echo "IMPORTANT: Please take good care of the tape.                 ";
echo "           Keep it dry and clean.                             ";
echo "                                                              ";
echo "                                                              ";
echo "                                                              ";
