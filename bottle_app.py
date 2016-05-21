from bottle import default_app, route, template, request
import requests
import json
import string

from api_key_config import g_api_key as api_key

origin_lat = '-24.1163612'
origin_long = '-46.6938933'

@route('/')
def mlb_home():

    query = request.GET.get('q', '')
    resultados = []
    linhas=[]
    map_url=''
    debug_box = '<h2>Debug info</h3>'

    if query:

        r = requests.get('https://api.mercadolibre.com/sites/MLB/search?q=%s' % query)
        p = json.loads(r.text)

        map_url = ''.join([
            'http://maps.googleapis.com/maps/api/staticmap'
            '?autoscale=2',
            '&visible={},{}'.format(origin_lat, origin_long),
            '&size=640x320',
            '&maptype=roadmap',
            '&key=', api_key,
            '&format=png',
            '&visual_refresh=true',
        ])

        labels = string.ascii_uppercase
        index = 0

        for i in p['results']:

            try:
                dest_lat = i['seller_address']['latitude']
                dest_long = i['seller_address']['longitude']

                distance_request = requests.get(
                        'https://maps.googleapis.com/maps/api/distancematrix/json?origins={},{}&destinations={},{}&key={}'
                        .format(origin_lat, origin_long, dest_lat, dest_long, api_key)
                    )
                d = json.loads(distance_request.text)

                index += 1

                lbl = labels[index % len(labels)]

                resultados += [{
                    'thumbnail':i['thumbnail'],
                    'title':i['title'],
                    'permalink':i['permalink'],
                    'price':i['price'],
                    'listing_type_id':i['listing_type_id'],
                    'latitude':i['seller_address']['latitude'],
                    'longitude':i['seller_address']['longitude'],
                    'distance_human':d['rows'][0]['elements'][0]['distance']['text'],
                    'distance':d['rows'][0]['elements'][0]['distance']['value'],
                    'free_shipping': i['shipping']['free_shipping'],
                    'index':lbl,
                    'marker':'&markers=size:{}%7Ccolor:{}%7Clabel:{}%7C{},{}'.format('mid', 'blue', lbl, dest_lat, dest_long),
                }]
            except:
                pass

        linhas = sorted(resultados, key=lambda item: item['distance'])[0:15]

        for l in linhas:
            map_url += l['marker']

    return template(
        'index',
        rows=linhas,
        q=query,
        d=debug_box,
        m=map_url,
    )

application = default_app()
