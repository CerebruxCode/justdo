# Justdo

_Simple pomodoro timer for your terminal... no deep shit_

### Usage

run in terminal :

```
justdo
```

or you can name your task, customize the timer and the reminder (in minutes) like

justdo 'some text" minutes reminder

```
justdo "super boring work" 
```


```
Usage: justdo [options...] [--version] [--help] [<task_name>]

Options:
  -d DURATION, --duration DURATION                                       Pomodoro time in mins [default: 25 ].
  -c Red|Green|Yellow|Blue|None, --color Red|Green|Yellow|Blue|None      Color of bar or None [default: Blue ].
  -r Red|Green|Yellow|Blue|None, --rev-color Red|Green|Yellow|Blue|None  Color of revision bar or None [default: Green ].
  -w WIDTH, --width WIDTH                                                Width of bar [default: 40 ].
  --notify                                                               Notify with message [default: on].
  --sound                                                                Notify with sound [default: on].
  --show                                                                 Show time remaining [default: on].
  --show-percentage                                                      Show percentage of time remaining [default: off].
  -v, --version                                                          Prints version.
  -h, --help                                                             Prints help.

Environment variables that are supported:
	NOTIFIER: The executable used to show notifications.
	NOTIFY_TITLE: The notification header.
	SPLAYER: The executable used to play sounds.
	SND_DONE: The done sound file.
	NO_COLOR: Disable color output (use any value).
```


Work nice in a small tmux horizontal window

### Installation (Optional)

You can clone the repository and then install the files in the apropriate places.

```
git clone https://github.com/CerebruxCode/justdo.git
cd justdo
sudo ./justdo --install
```
and then you can use it just as described in the usage section.

#### Arch Linux

If you have AUR enabled you can install it with your favorite aur helper. eg with yay:
```
yay -S justdo
```

### Assets

Complete sound file is the "Oxygen-Im-Phone-Ring.ogg" provided by the Oxygen KDE Theme.

