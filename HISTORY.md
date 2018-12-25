# Dirk's dotfiles history

Here is first of all the history of everything:


## Setting up the Mac entirely from scratch - this time \
with dotfiles


After updating to MacOS X Mojave, my time machine backup failed when I needed \
a recovery. So I decided to do it professionally this time. And therefore I \
created dotfiles for my personal setup, that anyone can use.

I created the gitlab account 
`thrvrs`
with the email
`gitlab@thrvrs.com`
and chose the standard password notation for the account.

I'll use the directory 

`~/.dotfiles`

in my user's home folder `/home/tornow/.dotfiles`

as the root directory for everything else. 


I started by erasing the Mac's disc entirely and formatting it with
disk encryption (File Vault) with the standard password pattern for
File Vault encryption. The encrypting part takes up some extra steps
and takes longer. But safe is better than sorry....

## Mac OS X setup steps (from a blank Mojave as initial OS - not an older one).

- register in Germany (My guess is that it this defines the itunes store and default app store)
- U.S. Keyboard
- Select Wifi and enter password
- Don't transfer any information from another computer
- Enter itunes id dirkt74@gmail.com and password (password for itunes on 1st and last)
- confirm using the apple id from another device
- create a new computer account "tornow" for adesso (password follows default pattern for adesso)
- Allow the itunes id to reset the password (afterwards enter the file vault password) setting up the account then takes a bit longer
- Set up iCloud keychain (yes)
- Storing files in iCloud (hell no)
- light theme


There you go - we have a newly setup mac with a very blank
Mac OS X Mojave

All email accounts were added automatically (as well as the game center 
account that we can delete later)

- Now check for mojave updates in the system settings and install any OS updates
- Go to system settings -> time machine  and deactivate automatic backups
- Press select disk and check "Encrypt backups" -> back will then ask you for \
the Time Machine backup password (the password for Time Machine follows the \
standard password pattern)

Then test the backup again and see if we can truly recover the computer from the
freshly made backup. This is not automatically a given. And it should be 
repeated every now and then. And one should have more than one backup disk...
And maybe it is a good idea to store the data also in the cloud on S3.


- Afterwards have more patience - the backups will take more than twice as long \
so make an initial backup and relax - time is too precious to get upset
- During recovery from disk you have to first enter the password for the \
tima machine backup encryption and then the root user's password for the \
destination disk. File Vault will be disabled until it is being re-enabled \
after the recovery is done. Wait until after the recovery (which seems much \
faster after file vault is switched off)

- After the recovery enter the password for the iCloud account (same as itunes
in my case)

- go to system preferences -> Securuty & privacy -> File Vault tab and activate \
File Vault with allowing iCloud Account to unlock the disk. In this scenario \
apple stores the recovery key encrypted in the iCloud and only you can decrypt \
it with the iCloud password (I guess). But most importantly - one doesn't have \
to write down the recovery key. \
The dialogue states that "You need your login password OR a recovery key to \
access your data" \
So I assume that it makes sure that the disk is encrypted with the login  \
password AND a recovery key. But now it doesn't ask for a "File Vault" password.

---

Now we achieved an initial state from which we can work on. 

- first activate all mail accounts that should have come with iCloud
- Remove tornow@adesso.de and game center from the internet accounts and feel \
free to activate or deactivate the iCloud acocunt (dirk.tornow@me.com)
- Close and re-open mail in order to see all folders properly. They don't come up \
by themselves without a restart of mail
- set relevant internet accounts to sync for contacts and calendars \
 (tornow@srvvrs.com, dirk.tornow@gmail.com) and open contacts for a full sync
- activate iMessage on the computer for the iTunes account

We have a naked operating system with which we can start working. We have our 
first machine backup and we are good to go.


In order to be able to test run dotfiles and its scripts, it is a very good idea 
to just run it in a virtual box hosted on the machine or the other computer. 
Probably on another machine would work better. And then working with snapshots 
to roll back to the beginning.

So after all this I installed VirtualBox that I downloaded from:
	https://www.virtualbox.org/wiki/Downloads
But the installation failed and I was reading through this article on
[Medium.com](https://medium.com/@DMeechan/fixing-the-installation-failed-virtualbox-error-on-mac-high-sierra-7c421362b5b5)
to fix it. It then (by allowing oracle as software vendor in 
`system preferences -> Security & Privacy`) worked on Mojave too. 

In order to run a Mojave guest on a Mojave host I was looking at 
https://github.com/AlexanderWillner/runMacOSinVirtualBox
(I didn't download the APP!!!)

As prerequisites I then had to install the VirtualBox extension pack that 
has to be downloaded and then added from within VirtualBox in the tab 
"extensions". 
Also I downloaded Mojave from the appstore again in order to be able to 
Create a VirtualBox image / hard drive.

Additionally there are a few more prerequisites that get 
automatically resolved when installing homebrew. So I installed home brew.


Installing HomeBrew with

`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

Instead of just downloading the RunMojaveVirtualBox app, I downloaded the
Source code from GitHub and ran the following command to alter some 
Settings for the VM

`make all VM_SIZE=65536`

(formerly I also used `VM_RES=1280x720` but this lead to a display error
 After installing Mojave. After the installation one can use the scale mode
 by using left-Command - C key combination when running the VM)

We then don't need the app at all - everything is being installed without
It. Also VirtualBox gets started and everything gets installed automatically.

Initially we have to choose a language (English) and then use the disk utils
To delete "VBox HARDDISK MEDIA" and format it as "Mojave" with 
"Mac OS X Extended (Case-sensitive, Journaled)" so that we can use it to
Install Mojave. The disk is now 64GB in size, so that we can play around
With it a lot.

Then we go back to the main menu of the helper utils and start the 
installation of Mojave in the disk. After the installation is done, the
Helper utils screen will pop up again. Shut down Mojave. Then remove
The disk macOS-Mojave.iso.cdr from the VM. 
Then reboot from the clover startup screen (use the arrow key and hit 
Enter). 

---

It is time to look at dotfiles now. 
First of all we need to make sure that all low level operating system 
settings are taken care of. 

I started reading about dotfiles here with the [Medium.com Article by \
Sajjad Hosseini] (https://medium.com/@Sajjadhosn/build-a-macos-empire-a0c83879ac24)

The core concepts are:
- Be a one-liner => To copy from Dotfiles repository’s README.md
- Have no dependencies => Should be executable on a fresh macOS.
- Require no manual intervention => Apart from initial sudo prompting, “it \
 shouldn’t insist on interactive input” as McIlroy puts it.
- Be able to install apps from the App Store and the rest will always get \
 Installed via homebrew (if available) or scripted
- Have everything scripted in single scripts or in an extractable way, so it \
 Is easy to re-use 

The file for bootstrapping the system should be named
`setup-mac-os.sh`

The documentation then refers to 
http://dotfiles.github.io \
Which led me to \
https://medium.com/@driesvints/getting-started-with-dotfiles-76bf046d035c \
which led me to \
https://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/ \
Which led me to \
https://github.com/holman/dotfiles


There I figured, that I can use the brew extension `mas` for downloading
Everything I ever bought or used from the appstore. For this to work I need
All the IDs from the appstore of the application.
---

## AppStore apps and their IDs:
---

- 1Password: 443987910 \
https://itunes.apple.com/de/app/1password/id443987910?l=en&mt=12
- Alinof Timer: 512464723 \
https://itunes.apple.com/de/app/alinof-timer/id512464723?l=en&mt=12
- Audio Merge & Split: 963571828 \
https://itunes.apple.com/de/app/audio-merge-split/id963571828?l=en&mt=12
- BetterSnapTool: 417375580 \
https://itunes.apple.com/de/app/bettersnaptool/id417375580?l=en&mt=12
- Camtasia 2: 478330793\
https://itunes.apple.com/de/app/camtasia-2/id478330793?l=en&mt=12
- CheatSheet: 529456740 \
https://itunes.apple.com/de/app/cheatsheet/id529456740?l=en&mt=12
- Evernote: 406056744 \
https://itunes.apple.com/de/app/evernote/id406056744?l=en&mt=12
- Folder Compare: 535348544 \
https://itunes.apple.com/de/app/folder-compare/id535348544?l=en&mt=12
- Get Plain Text: 508368068 \ 
https://itunes.apple.com/de/app/get-plain-text/id508368068?l=en&mt=12
- Infographics Lab - Templates: 577411683 (for keynote) \
https://itunes.apple.com/de/app/infographics-lab-templates/id577411683?l=en&mt=12
- Kindle: 405399194 \ 
https://itunes.apple.com/de/app/kindle/id405399194?l=en&mt=12
- Keynote: 409183694 \
https://itunes.apple.com/de/app/keynote/id409183694?l=en&mt=12
- Numbers: 409203825 \ 
https://itunes.apple.com/de/app/numbers/id409203825?l=en&mt=12
- Slack: 803453959 \
https://itunes.apple.com/de/app/slack/id803453959?l=en&mt=12
- SplitPrint: 412574988 \
https://itunes.apple.com/de/app/splitprint/id412574988?l=en&mt=12
- The Unarchiver: 425424353 \
https://itunes.apple.com/de/app/the-unarchiver/id425424353?l=en&mt=12
- VitaDock: 638118857 \
https://itunes.apple.com/de/app/vitadock/id638118857?l=en&mt=12
- WhatsApp Desktop: 1147396723 \
https://itunes.apple.com/de/app/whatsapp-desktop/id1147396723?l=en&mt=12


##This list translates into the following commands:
```
mas "1Password", id: 443987910
mas "Audio Merge & Split", id: 963571828
mas "BetterSnapTool", id: 417375580
mas "Camtasia 2", id: 478330793
mas "Folder Compare", id: 535348544
mas "Get Plain Text", id: 508368068
mas "Infographics Lab - Templates", id: 577411683
mas "Keynote", id: 409183694
mas "Numbers", id: 409203825
mas "SplitPrint", id: 412574988 
mas "VitaDock", id: 638118857
```

The missing apps that don't require a license and that can be installed with
brew casks are handled there further below

There are some more apps that I once purchased, but since I can't 
remember the last time I used them, I'll skip them for now. 
Maybe at one point in the future it is worth looking at them again.

## And here comes the list of apps / programs, that I haven't covered yet. 
- Alfred
- Alinof Timer
- Bartender
- Balsamiq
- BetterTouchTool
- Camunda Modeler
- Commander One
- CheatSheet
- Daisy Disk
- DbSchema
- Diffmerge
- DropBox
- Duet
- Evernote
- Firefox
- Forklift
- Google Chrome
- id-3 editor
- iterm 2
- Java
- KeePass
- Kindle
- Logitech Presenter
- Magic Prefs
- Mailbutler
- MySQL Workbench
- OmniDiskSweeper
- OmniFocus
- OmniGraffle
- OmniPlan
- Reflector
- PhpStorm
- Sequel Pro
- slack
- Skype
- Skype for Business
- Snagit
- SourceTree
- sublime text 3
- TeamViewer
- TheBrain
- The Unarchiver
- Tipp10
- µTorrent
- Vagrant (I did not install it just yet)
- VirtualBox 
- VLC
- Xmind 

---
With finding all casks, this website helps a lot: 
http://macappstore.org
## The above list translates into the following commands with brew
```
brew cask install alfred
brew cask install bartender
brew cask install balsamiq-mockups
brew cask install bettertouchtool
brew cask install camunda-modeler
brew cask install cheatsheet
brew cask install commander-one
brew cask install daisydisk
brew cask install dbschema
brew cask install diffmerge
brew cask install dropbox
brew cask install duet
brew cask install evernote
brew cask install firefox
brew cask install forklift
brew cask install google-chrome
brew cask install id3-editor
brew cask install iterm2
brew cask install java
brew cask install keepass
brew cask install kindle
brew cask install magicprefs
brew cask install mailbutler
brew cask install microsoft-office
brew cask install mongodb-compass-community
brew cask install mysqlworkbench
brew cask install omnidisksweeper
brew cask install omnifocus
brew cask install omnigraffle
brew cask install omniplan
brew cask install phpstorm
brew cask install reflector
brew cask install robo-3t
brew cask install sequel-pro
brew cask install slack
brew cask install skype
brew cask install skype-for-business
brew cask install snagit
brew cask install sourcetree
brew cask install sublime-text
brew cask install teamviewer
brew cask install thebrain
brew cask install the-unarchiver
brew cask install tipp10
brew cask install utorrent 
brew cask install vagrant
brew cask install vagrant-manager
brew cask install vagrant-vmware-utility
brew cask install virtualbox
brew cask install virtualbox-extension-pack
brew cask install vlc
brew cask install whatsapp
brew cask install xmind
``` 

## And here come the regular brew packages, that can be installed \
just with `brew install` 

\# Binaries
```
brew 'awscli'
brew 'ansible@2'
brew 'bash'
brew 'bat'
brew 'coreutils'
brew 'git'
brew 'gnupg2'
brew 'grep'
brew 'mas'
brew 'libgit2'
brew 'openssl'
brew 'tree'
brew 'unrar'
brew 'wget'
brew 'youtube-dl'
```


## These are the taps we'll use
```
tap 'caskroom/cask'
tap 'caskroom/eid'
tap 'caskroom/fonts'
tap 'caskroom/versions'
tap 'homebrew/bundle'
```

## Fonts
```
cask 'font-lato'
cask 'font-open-sans'
cask 'font-pt-sans'
cask 'font-roboto'
cask 'font-source-code-pro-for-powerline'
cask 'font-source-code-pro'
cask 'font-source-sans-pro'
cask 'font-source-serif-pro'
```

