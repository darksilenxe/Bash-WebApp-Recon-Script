#!/bin/bash
source ./scan.lib
getopts "m:" OPTION
MODE=$OPTARG
for i in "${@:$OPTIND:$#}"
do
    DOMAIN=$i
    DIRECTORY=${DOMAIN}_recon
    echo "Create directory $DIRECTORY."
    mkdir $DIRECTORY
    case $MODE in
    nmap-only)
        nmap_scan
        ;;
    feroxbuster-only)
        feroxbuster_scan
        ;;
    crt-only)
        crt_scan
        ;;
    gobuster-only)
        gobuster_scan
        ;;
    amass_only)
        amass_scan
        ;;
    *)
        nmap_scan
        feroxbuster_scan
        crt_scan
        gobuster_scan
        amass_scan
        ;;
    esac
    echo "Generating recon for $DOMAIN..."
    TODAY=$(date)
    echo "This scan was created on $TODAY" > $DIRECTORY/report
    if [ -f $DIRECTORY/nmap ];then
        echo "Results for Nmap:" >> $DIRECTORY/report
        grep -E "^\s*\S+\s+\S+\s+\S+\s*$" $DIRECTORY/nmap >> $DIRECTORY/report
    fi
    if [ -f $DIRECTORY/feroxbuster ];then
        echo "Results for Feroxbuster:" >> $DIRECTORY/report
        cat $DIRECTORY/feroxbuster >> $DIRECTORY/report
    fi
    if [ -f $DIRECTORY/gobuster ];then
        echo "Results for Gobuster:" >> $DIRECTORY/report
        cat $DIRECTORY/gobuster >> $DIRECTORY/report
    fi
    if [ -f $DIRECTORY/crt ];then
        echo "Results for crt.sh:" >> $DIRECTORY/report
        jq -r ".[] | .name_value" $DIRECTORY/crt >> $DIRECTORY/report
    fi
    if [ -f $DIRECTORY/amass ];then
        echo "Results for Amass:" >> $DIRECTORY/report
        cat $DIRECTORY/amass >> $DIRECTORY/report
    fi
done
    
