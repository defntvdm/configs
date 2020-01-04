#!/usr/bin/env python3

c.url.searchengines = {
    'DEFAULT': 'https://duckduckgo.com/?q={}',
    'g': 'https://www.google.com/search?q={}',
    'y': 'https://yandex.ru/search/?text={}',
    's': 'https://www.shodan.io/search?query={}'
}

# ad-block list
# https://easylist.to/easylist/easylist.txt
c.content.host_blocking.lists.append(str(config.configdir) + '/blockedHosts')

