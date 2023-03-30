#!/bin/bash

function hxgc()
{
	if [ "$1" != "" ]; then
		local filename=$(basename $1)
		local hextype=${filename##*-}

		if [ "$hextype" == "FS.hex" ]; then
			RUNTIME_CHECKSUM="0x"$(xxd -u -g 4 "$1" | grep CAMEOTAG | cut -d ' ' -f5)
			echo -e "RUNTIME: $RUNTIME_CHECKSUM"
		elif [ "$hextype" == "OS.hex" ]; then
			BOOT_CHECKSUM="0x"$(xxd -u -g 4 "$1" | grep CAMEOTAG | cut -d ' ' -f5)
			echo -e "BOOT   : $BOOT_CHECKSUM"
		else
			echo -e "only support FS.hex and OS.hex to get checksum!!!"
		fi
	else
		echo -e "Please input the filename!!!"
	fi
}

function vv()
{
	if [ "$1" != "" ]; then
		local filename=$1
		local filename2=${filename/:/ +}
		vi ${filename2%:*}
	else
		echo -e "Please input the filename!!!"
	fi
}

alias fn='find -name'
alias tp='tftp 10.90.90.49'
alias db='cd /home/nieting/mydebug/dgs1210-28p_b19962'
alias db2='cd /home/nieting/mydebug/DGS1210-20ME-A1'
alias dbsg='cd /home/nieting/mydebug/dgs1210-28p_test'
alias db52='cd /home/nieting/mydebug/DES-52-C1-db'
alias gr='grep -nr'
alias gir='grep -nir'
alias dft='cd core/code/future'
alias dct='cd core/code/customer/dlinkme'
alias d52='cd /home/nieting/mydebug/DES1210-52ME-C1'
alias d06='cd /home/nieting/mydebug/DGS1100-06ME'
alias d10='cd /home/nieting/mydebug/DGS1210-10'
alias da20='cd /home/nieting/mydebug/ReleaseFW_DGS1210-20ME-A1'
alias de10='cd /home/nieting/mydebug/DES1210-10-B2'
alias de283='cd /home/nieting/mydebug/DES1210-28-B3'
alias de106='cd /home/nieting/mydebug/DES1210'
alias gtpl='git pull'
alias gtad='git add'
alias gtps='git push'
alias gtst='git status'
alias gtdf='git diff'
alias gtbr='git br'
alias gtco='git checkout'
alias gtlg='git log'
alias gtsh='git show'
alias gtap='git apply'
alias gtcp='git cherry-pick -s'
alias tocl='touch core/code/future/cli/tools/src/cmdy.y'
alias ssim='grep -nr alias ~/bin/function.sh'
alias sl=ls
alias mk='sh ~/bin/error.sh'
alias vip='vim -p'

function gtba()
{
	if [ "$1" != "" ]; then
		if [ "$2" == "g" ]; then
			git blame $1 | grep "$3";
		elif [ "$2" == "" ]; then
			git blame $1;
		else
			if [ "$3" != "" ]; then
				git blame $1 -L $2,$3;
			else
				git blame $1 -L $2;
			fi
		fi
	else
		echo -e "Please input file name!!!"
	fi
}

function gii()
{
	grep -nir $1 --include="*$2"
}

function gtlr()
{
	echo -e "From 2021-$1 Redmine debug";
	git log --since=2021-"$1" --grep=Redmine;
}

function mytp()
{
	cp $1 /tftpboot/test.hex;
}

function myupdatecs()
{
	rm ./cscope.*;
	rm ./tags;
	cscope -Rbq;
	ctags -R;
}

function mybrcut()
{
	if [ "$1" != "" ]; then
		if [ "$2" != "" ]; then
			make git-info;
			dft;git pull;git co $1;git br;git st;cd -;
			dct;git pull;git co $2;git br;git st;cd -;
			make git-info;
		else
			echo -e "Please input the cust-branch number!!!"
		fi
	else
		echo -e "Please input the icore-branch number!!!"
	fi
}

function mylhex()
{
	if [ "$1" != "" ]; then
		ll non*;ll *$1*;ll *.mib;ll ISS.exe;
		hxgc *$1-FS.hex;
	else
		echo -e "Please input the version number!!!"
	fi
}


function cpreleasenote()
{
    #$1 B018 (fw_version)
    if [ "$1" != "" ]; then
        rm /home/xum/fwrelease/releasenotes/WS5-DGS-1210-10/*ote.txt;
        cp /home/xum/fwrelease/Firmwares/WS5-DGS-1210-10/$1/hex/*ote.txt /home/xum/fwrelease/releasenotes/WS5-DGS-1210-10/;
        sleep 1;
        rm /home/xum/fwrelease/releasenotes/WS5-DGS-1210-10-E1/*ote.txt;
        cp /home/xum/fwrelease/Firmwares/WS5-DGS-1210-10-E1/$1/hex/*ote.txt /home/xum/fwrelease/releasenotes/WS5-DGS-1210-10-E1/;
        sleep 1;
        rm /home/xum/fwrelease/releasenotes/WS5-DGS-1210-10P/*ote.txt;
        cp /home/xum/fwrelease/Firmwares/WS5-DGS-1210-10P/$1/hex/*ote.txt /home/xum/fwrelease/releasenotes/WS5-DGS-1210-10P/;
        sleep 1;
        rm /home/xum/fwrelease/releasenotes/WS5-DGS-1210-10P-E1/*ote.txt;
        cp /home/xum/fwrelease/Firmwares/WS5-DGS-1210-10P-E1/$1/hex/*ote.txt /home/xum/fwrelease/releasenotes/WS5-DGS-1210-10P-E1/;
        sleep 1;
        rm /home/xum/fwrelease/releasenotes/WS5-DGS-1210-12TS/*ote.txt;
        cp /home/xum/fwrelease/Firmwares/WS5-DGS-1210-12TS/$1/hex/*ote.txt /home/xum/fwrelease/releasenotes/WS5-DGS-1210-12TS/;
        sleep 1;
        rm /home/xum/fwrelease/releasenotes/WS5-DGS-1210-20/*ote.txt;
        cp /home/xum/fwrelease/Firmwares/WS5-DGS-1210-20/$1/hex/*ote.txt /home/xum/fwrelease/releasenotes/WS5-DGS-1210-20/;
        sleep 1;
        rm /home/xum/fwrelease/releasenotes/WS5-DGS-1210-20-E1/*ote.txt;
        cp /home/xum/fwrelease/Firmwares/WS5-DGS-1210-20-E1/$1/hex/*ote.txt /home/xum/fwrelease/releasenotes/WS5-DGS-1210-20-E1/;
        sleep 1;
        rm /home/xum/fwrelease/releasenotes/WS5-DGS-1210-28/*ote.txt;
        cp /home/xum/fwrelease/Firmwares/WS5-DGS-1210-28/$1/hex/*ote.txt /home/xum/fwrelease/releasenotes/WS5-DGS-1210-28/;
        sleep 1;
        rm /home/xum/fwrelease/releasenotes/WS5-DGS-1210-28-E1/*ote.txt;
        cp /home/xum/fwrelease/Firmwares/WS5-DGS-1210-28-E1/$1/hex/*ote.txt /home/xum/fwrelease/releasenotes/WS5-DGS-1210-28-E1/;
        sleep 1;
        rm /home/xum/fwrelease/releasenotes/WS5-DGS-1210-28MP/*ote.txt;
        cp /home/xum/fwrelease/Firmwares/WS5-DGS-1210-28MP/$1/hex/*ote.txt /home/xum/fwrelease/releasenotes/WS5-DGS-1210-28MP/;
        sleep 1;
        rm /home/xum/fwrelease/releasenotes/WS5-DGS-1210-28P/*ote.txt;
        cp /home/xum/fwrelease/Firmwares/WS5-DGS-1210-28P/$1/hex/*ote.txt /home/xum/fwrelease/releasenotes/WS5-DGS-1210-28P/;
        sleep 1;
        rm /home/xum/fwrelease/releasenotes/WS5-DGS-1210-28P-E1/*ote.txt;
        cp /home/xum/fwrelease/Firmwares/WS5-DGS-1210-28P-E1/$1/hex/*ote.txt /home/xum/fwrelease/releasenotes/WS5-DGS-1210-28P-E1/;
        sleep 1;
        rm /home/xum/fwrelease/releasenotes/WS5-DGS-1210-28X/*ote.txt;
        cp /home/xum/fwrelease/Firmwares/WS5-DGS-1210-28X/$1/hex/*ote.txt /home/xum/fwrelease/releasenotes/WS5-DGS-1210-28X/;
        sleep 1;
        rm /home/xum/fwrelease/releasenotes/WS5-DGS-1210-28XS/*ote.txt;
        cp /home/xum/fwrelease/Firmwares/WS5-DGS-1210-28XS/$1/hex/*ote.txt /home/xum/fwrelease/releasenotes/WS5-DGS-1210-28XS/;
        sleep 1;
        rm /home/xum/fwrelease/releasenotes/WS5-DGS-1210-52/*ote.txt;
        cp /home/xum/fwrelease/Firmwares/WS5-DGS-1210-52/$1/hex/*ote.txt /home/xum/fwrelease/releasenotes/WS5-DGS-1210-52/;
        sleep 1;
        rm /home/xum/fwrelease/releasenotes/WS5-DGS-1210-52-E1/*ote.txt;
        cp /home/xum/fwrelease/Firmwares/WS5-DGS-1210-52-E1/$1/hex/*ote.txt /home/xum/fwrelease/releasenotes/WS5-DGS-1210-52-E1/;
        sleep 1;
        rm /home/xum/fwrelease/releasenotes/WS5-DGS-1210-52MP/*ote.txt;
        cp /home/xum/fwrelease/Firmwares/WS5-DGS-1210-52MP/$1/hex/*ote.txt /home/xum/fwrelease/releasenotes/WS5-DGS-1210-52MP/;
        sleep 1;
        rm /home/xum/fwrelease/releasenotes/WS5-DGS-1210-52MP-E1/*ote.txt;
        cp /home/xum/fwrelease/Firmwares/WS5-DGS-1210-52MP-E1/$1/hex/*ote.txt /home/xum/fwrelease/releasenotes/WS5-DGS-1210-52MP-E1/;
        sleep 1;
        rm /home/xum/fwrelease/releasenotes/WS5-DGS-1210-52MPP/*ote.txt;
        cp /home/xum/fwrelease/Firmwares/WS5-DGS-1210-52MPP/$1/hex/*ote.txt /home/xum/fwrelease/releasenotes/WS5-DGS-1210-52MPP/;
        sleep 1;
        rm /home/xum/fwrelease/releasenotes/WS5-DGS-1210-52P/*ote.txt;
        cp /home/xum/fwrelease/Firmwares/WS5-DGS-1210-52P/$1/hex/*ote.txt /home/xum/fwrelease/releasenotes/WS5-DGS-1210-52P/;
        sleep 1;
        rm /home/xum/fwrelease/releasenotes/WS5-DGS-1210-52P-E1/*ote.txt;
        cp /home/xum/fwrelease/Firmwares/WS5-DGS-1210-52P-E1/$1/hex/*ote.txt /home/xum/fwrelease/releasenotes/WS5-DGS-1210-52P-E1/;
    fi
}


function mycphex()
{
	#$1 DGS-1210-10ME-A1-6-14
	#$2 B018 (fw_version)
	#$3 004 (mib_version----options)
	#eg.mycphex DES-1210-10ME-B2-10-05 B018 004
	if [ "$1" != "" ]; then
		if [ "$2" != "" ]; then
			cp $1-$2-ALL.hex ~/d_FW_tet/$1/;
			sleep 1;
			cp $1-$2.bin ~/d_FW_tet/$1/;
			cp ISS.exe ~/d_FW_tet/$1/;
			sleep 1;
			cp $1-$2.hex ~/d_FW_tet/$1/;
			cp non* ~/d_FW_tet/$1/$1-$2_cmds.csv;
			sleep 1;
			if [ "$3" != "" ]; then
				cp *-$3.mib ~/d_FW_tet/$1/;
			else
				echo -e "This version not cp mib.file...."
			fi
		else
			echo -e "Please input the version number!!!"
		fi
	else
		echo -e "Please input the cp-dir!!!"
	fi
}

ftp_ipaddress=172.22.102.203
ftp_username=109756_nieting
ftp_password=iOTLXJlo
ftp_hex_root_dir=/switch/Projects/D-Link/Sunflower/Firmware
local_hex_dir=/home/nieting/d_FW_tet

function myftpupload()
{
	#$1 018
	#$2 DGS-1210-10ME-A1-6-14
	#$3 004 (mib_version----options)
	#eg.myftpupload 018 DES-1210-10ME-B2-10-05 004
	if [ "$1" != "" ]; then
		if [ "$2" != "" ]; then
			local cmds=~/bin/ftpAutoUpload_cmd

			echo "use $ftp_username $ftp_password
			binary
			prompt
			cd $ftp_hex_root_dir/B$1
			lcd $local_hex_dir" > $cmds

			if [ "$2" == "DGS-1210-20ME-A1-6-14" ];then
				echo "put $2/$2-B$1_FW_Release\ Note.txt $ftp_hex_root_dir/B$1/DGS-1210_ME_v6.14.Bxxx/DGS-1210-20-ME/$2-B$1_FW_Release\ Note.txt
				put $2/$2-B$1_cmds.csv $ftp_hex_root_dir/B$1/DGS-1210_ME_v6.14.Bxxx/DGS-1210-20-ME/$2-B$1_cmds.csv
				put $2/$2-B$1.hex $ftp_hex_root_dir/B$1/DGS-1210_ME_v6.14.Bxxx/DGS-1210-20-ME/$2-B$1.hex
				put $2/$2-B$1.bin $ftp_hex_root_dir/backup/B$1/DGS-1210_ME_v6.14.Bxxx/DGS-1210-20-ME/$2-B$1.bin
				put $2/ISS.exe $ftp_hex_root_dir/backup/B$1/DGS-1210_ME_v6.14.Bxxx/DGS-1210-20-ME/ISS.exe
				put $2/$2-B$1-ALL.hex $ftp_hex_root_dir/B$1/AllHEX/DGS-6-14-Bxx/$2-B$1-ALL.hex" >> $cmds
				if [ "$3" != "" ];then
					echo "put $2/DGS-1210-20ME-AX-6-14-$3.mib $ftp_hex_root_dir/B$1/DGS-1210_ME_v6.14.Bxxx/DGS-1210-20-ME/DGS-1210-20ME-AX-6-14-$3.mib" >> $cmds
				fi
			elif [ "$2" == "DES-1210-52ME-C1-20-04" ];then
				echo "put $2/$2-B$1_FW_Release\ Note.txt $ftp_hex_root_dir/B$1/DES-1210-52ME_v20.04.Bxxx/$2-B$1_FW_Release\ Note.txt
				put $2/$2-B$1_cmds.csv $ftp_hex_root_dir/B$1/DES-1210-52ME_v20.04.Bxxx/$2-B$1_cmds.csv
				put $2/$2-B$1.hex $ftp_hex_root_dir/B$1/DES-1210-52ME_v20.04.Bxxx/$2-B$1.hex
				put $2/$2-B$1.bin $ftp_hex_root_dir/backup/B$1/DES-1210-52ME_v20.04.Bxxx/$2-B$1.bin
				put $2/ISS.exe $ftp_hex_root_dir/backup/B$1/DES-1210-52ME_v20.04.Bxxx/ISS.exe
				put $2/$2-B$1-ALL.hex $ftp_hex_root_dir/B$1/AllHEX/DES-20-04-Bxx/$2-B$1-ALL.hex" >> $cmds
				if [ "$3" != "" ];then
					echo "put $2/DES-1210-52ME-CX-20-04-$3.mib $ftp_hex_root_dir/B$1/DES-1210-52ME_v20.04.Bxxx/DES-1210-52ME-CX-20-04-$3.mib" >> $cmds
				fi
			elif [ "$2" == "DES-1210-10ME-B2-10-05" ];then
				echo "put $2/$2-B$1_FW_Release\ Note.txt $ftp_hex_root_dir/B$1/DES-1210_ME_v10.05.Bxxx/DES-1210-10-ME_B2/$2-B$1_FW_Release\ Note.txt
				put $2/$2-B$1_cmds.csv $ftp_hex_root_dir/B$1/DES-1210_ME_v10.05.Bxxx/DES-1210-10-ME_B2/$2-B$1_cmds.csv
				put $2/$2-B$1.hex $ftp_hex_root_dir/B$1/DES-1210_ME_v10.05.Bxxx/DES-1210-10-ME_B2/$2-B$1.hex
				put $2/$2-B$1.bin $ftp_hex_root_dir/backup/B$1/DES-1210_ME_v10.05.Bxxx/DES-1210-10-ME_B2/$2-B$1.bin
				put $2/ISS.exe $ftp_hex_root_dir/backup/B$1/DES-1210_ME_v10.05.Bxxx/DES-1210-10-ME_B2/ISS.exe
				put $2/$2-B$1-ALL.hex $ftp_hex_root_dir/B$1/AllHEX/DES-10-05-Bxx/$2-B$1-ALL.hex" >> $cmds
				if [ "$3" != "" ];then
					echo "put $2/DES-1210-10ME-B2-10-05-$3.mib $ftp_hex_root_dir/B$1/DES-1210_ME_v10.05.Bxxx/DES-1210-10-ME_B2/DES-1210-10ME-B2-10-05-$3.mib" >> $cmds
				fi
			elif [ "$2" == "DES-1210-28ME-B3-10-05" ];then
				echo "put $2/$2-B$1_FW_Release\ Note.txt $ftp_hex_root_dir/B$1/DES-1210_ME_v10.05.Bxxx/DES-1210-28-ME_B3/$2-B$1_FW_Release\ Note.txt
				put $2/$2-B$1_cmds.csv $ftp_hex_root_dir/B$1/DES-1210_ME_v10.05.Bxxx/DES-1210-28-ME_B3/$2-B$1_cmds.csv
				put $2/$2-B$1.hex $ftp_hex_root_dir/B$1/DES-1210_ME_v10.05.Bxxx/DES-1210-28-ME_B3/$2-B$1.hex
				put $2/$2-B$1.bin $ftp_hex_root_dir/backup/B$1/DES-1210_ME_v10.05.Bxxx/DES-1210-28-ME_B3/$2-B$1.bin
				put $2/ISS.exe $ftp_hex_root_dir/backup/B$1/DES-1210_ME_v10.05.Bxxx/DES-1210-28-ME_B3/ISS.exe
				put $2/$2-B$1-ALL.hex $ftp_hex_root_dir/B$1/AllHEX/DES-10-05-Bxx/$2-B$1-ALL.hex" >> $cmds
				if [ "$3" != "" ];then
					echo "put $2/DES-1210-28ME-B3-10-05-$3.mib $ftp_hex_root_dir/B$1/DES-1210_ME_v10.05.Bxxx/DES-1210-28-ME_B3/DES-1210-28ME-B3-10-05-$3.mib" >> $cmds
				fi
			elif [ "$2" == "DES-1210-10ME-B1-6-11" ];then
				echo "put $2/$2-B$1_FW_Release\ Note.txt $ftp_hex_root_dir/B$1/DES-1210_ME_v6.11.Bxxx/DES-1210-10-ME_B1/$2-B$1_FW_Release\ Note.txt
				put $2/$2-B$1_cmds.csv $ftp_hex_root_dir/B$1/DES-1210_ME_v6.11.Bxxx/DES-1210-10-ME_B1/$2-B$1_cmds.csv
				put $2/$2-B$1.hex $ftp_hex_root_dir/B$1/DES-1210_ME_v6.11.Bxxx/DES-1210-10-ME_B1/$2-B$1.hex
				put $2/$2-B$1.bin $ftp_hex_root_dir/backup/B$1/DES-1210_ME_v6.11.Bxxx/DES-1210-10-ME_B1/$2-B$1.bin
				put $2/ISS.exe $ftp_hex_root_dir/backup/B$1/DES-1210_ME_v6.11.Bxxx/DES-1210-10-ME_B1/ISS.exe
				put $2/$2-B$1-ALL.hex $ftp_hex_root_dir/B$1/AllHEX/DES-6-11-Bxx/$2-B$1-ALL.hex" >> $cmds
				if [ "$3" != "" ];then
					echo "put $2/DES-1210-10ME-B1-6-11-$3.mib $ftp_hex_root_dir/B$1/DES-1210_ME_v6.11.Bxxx/DES-1210-10-ME_B1/DES-1210-10ME-B1-6-11-$3.mib" >> $cmds
				fi
			elif [ "$2" == "DGS-1100-06ME-A1-1-05" ];then
				echo "put $2/$2-B$1_FW_Release\ Note.txt $ftp_hex_root_dir/B$1/DGS-1100-06ME_v1.05.Bxxx/$2-B$1_FW_Release\ Note.txt
				put $2/$2-B$1_cmds.csv $ftp_hex_root_dir/B$1/DGS-1100-06ME_v1.05.Bxxx/$2-B$1_cmds.csv
				put $2/$2-B$1.hex $ftp_hex_root_dir/B$1/DGS-1100-06ME_v1.05.Bxxx/$2-B$1.hex
				put $2/$2-B$1.bin $ftp_hex_root_dir/backup/B$1/DGS-1100-06ME_v1.05.Bxxx/$2-B$1.bin
				put $2/ISS.exe $ftp_hex_root_dir/backup/B$1/DGS-1100-06ME_v1.05.Bxxx/ISS.exe
				put $2/$2-B$1-ALL.hex $ftp_hex_root_dir/B$1/AllHEX/DGS-1100-06ME-Xxx/$2-B$1-ALL.hex" >> $cmds
			else
				echo "bye" >> $cmds
			fi

			echo "bye" >> $cmds
			ftp -v -n $ftp_ipaddress < $cmds
			rm -rf $cmds
		else
			echo -e "Please input the work dir!!!"
		fi
	else
		echo -e "Please input the version number!!!"
	fi
}

function up49()
{
	if [ "$1" != "" ]; then
		local cmds=~/bin/ftp49AutoUpload_cmd

		echo "use nt nieting
		binary
		prompt
		put $1
		bye" > $cmds

		ftp -v -n 192.168.103.49 < $cmds
		rm -rf $cmds
	else
		echo -e "Please input the upload filename!!!"
	fi
}

function down49()
{
	if [ "$1" != "" ]; then
		local cmds=~/bin/ftp49AutoDownload_cmd

		echo "use nt nieting
		binary
		prompt
		get $1
		bye" > $cmds

		ftp -v -n 192.168.103.49 < $cmds
		rm -rf $cmds
	else
		echo -e "Please input the download filename!!!"
	fi
}

function show49()
{
	local cmds=~/bin/ftp49show_cmd

	echo "use nt nieting
	binary
	prompt
	ls -t
	bye" > $cmds

	ftp -v -n 10.90.90.49 < $cmds
	rm -rf $cmds
}
