import logging
import http.server
import socketserver
import datetime
import time
import easyocr

logging.basicConfig(level=logging.DEBUG, format='%(asctime)s %(filename)s:%(lineno)d %(levelname)s %(message)s',
                    datefmt='%a, %d %b %Y %H:%M:%S', filename='/easyocr/log', filemode='w')

now = time.time()
logging.info(datetime.datetime.now(), 'loading model [en,ch_sim]')
reader = easyocr.Reader(['en', 'ch_sim'])
logging.info(datetime.datetime.now(),
             'load model [en,ch_sim] in', time.time()-now, 'seconds')


class Handler(http.server.BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()

        self.wfile.write(reader.readtext(
            ('/easyocr/image'+self.path).encode('utf-8')))

        return


with socketserver.TCPServer(("", 8080), Handler) as httpd:
    logging.info(datetime.datetime.now(), 'listening http on 8080')
    httpd.serve_forever()
