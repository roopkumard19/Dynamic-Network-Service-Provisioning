import sched, time, os, psutil


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


s = sched.scheduler(time.time, time.sleep)
def do_something(sc): 
    #print "Doing stuff..."
    os.system('''speedtest-cli --simple | perl -pe 's/^(.*): (.*) (.*?)(\/s)?\n/$1_$3: $2, /m' | cut -d',' -f 1-3''') 
    print "CPU Percent : ", psutil.cpu_percent()
    print "Disk Usage : ", disk_usage('/')
    s.enter(2, 1, do_something, (sc,))

s.enter(1, 1, do_something, (s,))
s.run()
