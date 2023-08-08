import requests


def count_words(subreddit, word_list, after=None, word_count={}):
    url = f"https://www.reddit.com/r/{subreddit}/hot.json?limit=100"
    headers = {'User-Agent': 'Mozilla/5.0'}
    params = {'after': after}
    response = requests.get(url, headers=headers, params=params)
    if response.status_code == 200:
        data = response.json()['data']
        after = data['after']
        posts = data['children']
        for post in posts:
            title = post['data']['title'].lower()
            for word in word_list:
                if word.lower() in title:
                    if word.lower() in word_count:
                        word_count[word.lower()] += 1
                    else:
                        word_count[word.lower()] = 1
        if after is None:
            sorted_words = sorted(word_count.items(), key=lambda x: (-x[1], x[0]))
            for word in sorted_words:
                print(f"{word[0]}: {word[1]}")
            return
        else:
            return count_words(subreddit, word_list, after, word_count)
    else:
        print(None) 
