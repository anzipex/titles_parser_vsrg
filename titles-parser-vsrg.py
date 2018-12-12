import requests
import lxml.html as lh
import pandas as pd
import re
import sys

if len(sys.argv) <= 1 or len(sys.argv) > 2:
    print('\x1b[6;30;41m' + 'Error!' + '\x1b[0m\n' + 'Required url as argument')
    sys.exit(1)

args = list(sys.argv)
url = args[1]

print("Parsing `Title` from: " + '\x1b[0;30;43m' + url + '\x1b[0m' + ' ... ')
filename = 'titles' + '-' + url.rsplit('/', 1)[-1] + '.txt'

page = requests.get(url)
doc = lh.fromstring(page.content)
tr_elements = doc.xpath('//tr')

col=[]
passage = 0
desired_index = 0
checker = False

for passage in range(0, len(tr_elements)):
    for t in tr_elements[passage]:
        name=t.text_content()
        col.append((name,[]))
        tag = ''.join(str(x) for x in col[passage][0])
        tag = tag.strip()
        if tag == "Title":
            if checker == False:
                desired_index = passage - 1
                checker = True

df = pd.read_html(url)[desired_index][1].pipe(lambda df: df.rename(columns=df.iloc[0]).drop(0))
titles = df.tolist()

sorted_titles = []
for x in range(len(titles)):
    title = re.sub('[*]?$', '', titles[x])
    sorted_titles.append(title)

file = open(filename, "w")
for x in range(len(sorted_titles)):
    file.write(sorted_titles[x] + "\n")
file.close()

print('\x1b[6;30;42m' + 'Success!' + '\x1b[0m')
print('Output: ' + sys.path[0] + '/' + str(filename))

sys.exit(0)
