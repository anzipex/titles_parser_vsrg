# titles_parser_vsrg
For scrapping any Titles on pages from http://vsrecommendedgames.wikia.com to text file

###### Requirements:
```
Python 3 or higher (i used Python 3.4.3)
pip install requests (i used 2.2.1)
pip install pandas (i used 0.22.0)
pip install lxml (i used 3.3.3)
```

###### Usage example:
```
username@hostname:~$ python3 titles-parser-vsrg.py http://vsrecommendedgames.wikia.com/wiki/Arcade_games/Rhythm
username@hostname:~$ ls && cat *Rhythm*
titles-Rhythm.txt
beatmania THE FINAL
beatmania IIDX 21 SPADA
Dance Dance Revolution X2
DJMax Technika 3
DrumMania V8
GuitarFreaks V8
In the Groove 2
jubeat saucer (fulfill)
Pop'n Music sunny park
Pump It Up Fiesta EX or Pump It Up Fiesta 2
```

###### dummy-copier.bash:
Prototype script that copies titles.txt founded ROMs / ISOs (etc) to directory with sub-folder '!Sorted'
```
username@hostname:~$ ./dummy-copier.bash ~/foo/titles-TurboGrafx-16.txt ~/bar/GoodPCE
```
