import os

import requests
import xmltodict
from bottle import run, Bottle

HEADER = {
    'Accept-Encoding': 'gzip, deflate, sdch',
    'Accept': 'application/xhtml+xml,application/xml --compressed',
}

BBC_URL = os.getenv('BBC_URI')


app = Bottle()


@app.route('/health')
def health_check():
    return {'message': 'UP'}


def build_news_from(data):
    return {
        'title': data.get('title'),
        'published': data.get('pubDate'),
        'label': 'experimental'
    }


@app.route('/news')
def get_news():
    response = requests.get(BBC_URL, HEADER)
    dict_response = dict(xmltodict.parse(response.content))
    data_news = dict_response.get('rss').get('channel').get('item')

    return {
        'news': list(map(build_news_from, data_news))
    }


if __name__ == '__main__':
    run(app, host='0.0.0.0', port=8080, debug=False, reloader=True)
