#!/usr/bin/env python
# -*- coding: utf-8 -*-
#title           :menu.py
#description     :This program displays an interactive menu on CLI
#author          :
#date            :
#version         :0.1
#usage           :python menu.py
#notes           :
#python_version  :2.7.6  
#=======================================================================

# Import the modules needed to run the script.
import sys, os, os.path
import subprocess

userDir = os.environ.get('BBS_USER_HOME')

class Fore:
    WHITE = '\033[1;37;40m'
    MAGENTA = '\033[1;35;40m'
    GREEN = '\033[1;32;40m'
    BLUE = '\033[1;34;40m'
    RED = '\033[1;31;40m'
    YELLOW = '\033[1;33;40m'


def display_item(zNum, zName, zDir):
    savedCount = int(len(os.listdir(userDir + "/" + zDir )) - 1 )
    print Fore.YELLOW + zNum.ljust(3,' ') + " "  + Fore.GREEN + zName.ljust(30,'.') + Fore.BLUE + " Saves:" +  str(savedCount)

def run_item(zDat, zDir):
    fileList = os.listdir(userDir + "/" + zDir )
    fileList.remove(zDat)

    if len(fileList) == 0:
        print Fore.GREEN + "You do not have any saved games...\n"
    else:
        print Fore.GREEN + "You have the following saved games...\n"
    
    if len(fileList) % 2 != 0:
        fileList.append(" ")
    split = len(fileList)/2
    l1 = fileList[0:split]
    l2 = fileList[split:]
    for key, value in zip(l1,l2):
        print(Fore.YELLOW + '[' + Fore.MAGENTA + '{0:<20s}' + Fore.YELLOW + ']    [' + Fore.MAGENTA + '{1:<20s}' + Fore.YELLOW + ']').format(key, value)

    if len(fileList) == 0:
        print Fore.WHITE + "\nType \"save\" while playing to save a game.\n"
    else:
        print Fore.WHITE + "\nType \"restore\" while playing to restore your game.\n\n" + Fore.RED + "Remember " + Fore.YELLOW + "the" + Fore.BLUE + " CASE SeNsItIvE" + Fore.YELLOW + " game name above. It won't be displayed again.\n" + Fore.GREEN
    
    launch = raw_input("\nPress enter to start your adventure >>  ")
    subprocess.call(['/home/wwiv/bbs/chains/native_jzip.sh', zDat, zDir])


# Main definition - constants
menu_actions  = {}  

# =======================
#     MENUS FUNCTIONS
# =======================

# Main menu
def main_menu():
    os.system('clear')
    print Fore.MAGENTA + "Choose your adventure.\n"
    print Fore.YELLOW + "Select game or story:"
    display_item( "1.", "A mind forever voyaging", "amfv")
    display_item( "2.", "Adventure (caves, avent)", "advent")
    display_item( "3.", "Bureaucracy", "bureaucr")
    display_item( "4.", "Cutthroats", "cutthroa")
    display_item( "5.", "Enchanted", "enchante")
    display_item( "6.", "Hitchhikers Guide to galaxy", "hhgg")
    display_item( "7.", "Leather Goddess of Phobes", "leather")
    display_item( "8.", "Lurking Horror", "lurking")
    display_item( "9.", "Moonmist", "moonmist")
    display_item( "10.", "Nord and Bert", "nordandb")
    display_item( "11.", "Planetfall", "planetfa")
    display_item( "12.", "Sorcerer", "sorcerer")
    display_item( "13.", "Spellbreaker", "spellbre")
    display_item( "14.", "Stationfall", "stationf")
    display_item( "15.", "Trinity", "trinity")
    display_item( "16.", "Wishbringer", "wishbrin")
    display_item( "17.", "Zork 1", "zork1")
    display_item( "18.", "Zork 2", "zork2")
    display_item( "19.", "Zork 3", "zork3")
    print Fore.RED + "\n0." + Fore.GREEN + " Quit" + Fore.BLUE
    choice = raw_input(" >>  ")
    exec_menu(choice)

    return

# Execute menu
def exec_menu(choice):
    os.system('clear')
    ch = choice.lower()
    if ch == '':
        menu_actions['main_menu']()
    else:
        try:
            menu_actions[ch]()
        except KeyError:
            print "Invalid selection, please try again.\n"
            menu_actions['main_menu']()
    return

# Menu 1
def menu1():
    run_item('amfv.dat', 'amfv')
    main_menu()
def menu2():
    run_item('advent.z5', 'advent')
    main_menu()
def menu3():
    run_item('bureaucr.dat', 'bureaucr')
    main_menu()
def menu4():
    run_item('cutthroa.dat', 'cutthroa')
    main_menu()
def menu5():
    run_item('enchante.dat', 'enchante')
    main_menu()
def menu6():
    run_item('hhgg.dat', 'hhgg')
    main_menu()
def menu7():
    run_item('leather.z5', 'leather')
    main_menu()
def menu8():
    run_item('lurking.dat', 'lurking')
    main_menu()
def menu9():
    run_item('moonmist.dat', 'moonmist')
    main_menu()
def menu10():
    run_item('nordandb.dat', 'nordandb')
    main_menu()
def menu11():
    run_item('planetfa.z5', 'planetfa')
    main_menu()
def menu12():
    run_item('sorcerer.dat', 'sorcerer')
    main_menu()
def menu13():
    run_item('spellbre.dat', 'spellbre')
    main_menu()
def menu14():
    run_item('stationf.dat', 'stationf')
    main_menu()
def menu15():
    run_item('trinity.dat', 'trinity')
    main_menu()
def menu16():
    run_item('wishbrin.z5', 'wishbrin')
    main_menu()
def menu17():
    run_item('zork1.dat', 'zork1')
    main_menu()
def menu18():
    run_item('zork2.dat', 'zork2')
    main_menu()
def menu19():
    run_item('zork3.dat', 'zork3')
    main_menu()


# Back to main menu
def back():
    menu_actions['main_menu']()

# Exit program
def exit():
    sys.exit()

# =======================
#    MENUS DEFINITIONS
# =======================

# Menu definition
menu_actions = {
    'main_menu': main_menu,
    '1': menu1,
    '2': menu2,
    '3': menu3,
    '4': menu4,
    '5': menu5,
    '6': menu6,
    '7': menu7,
    '8': menu8,
    '9': menu9,
    '10': menu10,
    '11': menu11,
    '12': menu12,
    '13': menu13,
    '14': menu14,
    '15': menu15,
    '16': menu16,
    '17': menu17,
    '18': menu18,
    '19': menu19,
    '0': exit,
    'q': exit,
    'Q': exit,
}

# =======================
#      MAIN PROGRAM
# =======================

# Main Program
if __name__ == "__main__":
    # Launch main menu
    main_menu()
