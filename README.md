# titles_parser_vsrg
For scrapping any 'Titles' on pages http://vsrecommendedgames.wikia.com

###### Requirements:
```
Python 3 or higher (I used Python 3.4.3)
pip install requests (I used 2.2.1)
pip install pandas (I used 0.22.0)
pip install lxml (I used 3.3.3)
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

###### dummy-copier:
Prototype script that copies **titles-xxx.txt** founded ROMs / ISOs (etc) to directory with subfolder called **!Selected**
```
username@hostname:~$ ./dummy-copier.bash ~/foo/titles-TurboGrafx-16.txt ~/bar/GoodPCE/
```
