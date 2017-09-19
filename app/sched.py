import flask
from flask_restful import Resource, Api
import schedule, time, os, psutil, json
from collections import OrderedDict

app = flask.Flask(__name__)
api = Api(app)

def bytes2human(n):
    """
    >>> bytes2human(10000)
    '9K'
    >>> bytes2human(100001221)
    '95M'
    """
    symbols = ('K', 'M', 'G', 'T', 'P', 'E', 'Z', 'Y')
    prefix = {}
    for i, s in enumerate(symbols):
        prefix[s] = 1 << (i+1)*10
    for s in reversed(symbols):
        if n >= prefix[s]:
            value = int(float(n) / prefix[s])
            return '%s%s' % (value, s)
    return "%sB" % n


def disk_usage(dir):
    usage = psutil.disk_usage(dir)
    return " %s %.0f%%" \
            % (bytes2human(usage.used), usage.percent)

@app.route('/')

def job():
    '''final = []
    final = OrderedDict(final) 
    os.system("speedtest-cli --simple > log.log")
    final['cpu'] = psutil.cpu_percent()
    final['disk'] = disk_usage('/')
    with open("log.log", 'r') as file:
        for line in file:
            if "Download:" in line:
		download = line.split(" ")
                final['download-speed'] = download[1]
            if "Upload:" in line:
                upload = line.split(" ")
                final['upload-speed'] = upload[1]
    result = json.dumps(final)
    '''
    result = str(psutil.virtual_memory().percent
    with open("sending.log", 'a') as file:
        file.write(result + "\n")

    with open("sending.log", 'r') as file:
        return flask.Response(file.read(), mimetype='text/plain')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
    
#    schedule.every().minutes.do(job)
 #   while True:
#	schedule.run_pending()

