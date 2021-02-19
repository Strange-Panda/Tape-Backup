Expecto-Patronum Version 1.04 rev. 202102121024
Tape-Backup using'TAR' & 'MT' for UNIX | 2021 christoph[at]reit-it.de
Copyright (C) 2021  Christoph Reit 


This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.

This script is designed to transfer folders from a Linux machine (in this case RedHat) to an LTO tape drive. 
It uses gzip as compression method. 

Additionally a logfile is created [/var/log/tape-backup_`date +"%Y-%m-%d_%H-%M"`.log] which lists all backed up data.

'/dev/st0 defines' the tape-drive

'/backup/folder' defines the folder you want to backup. 
