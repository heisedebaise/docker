import logging
import http.server
import socketserver
import time
import easyocr

logging.basicConfig(level=logging.DEBUG, format='%(asctime)s %(filename)s:%(lineno)d %(levelname)s %(message)s',
                    datefmt='%a, %d %b %Y %H:%M:%S', filename='/easyocr/log', filemode='a')

now = time.time()
logging.info('loading model [en,ch_sim]')
reader = easyocr.Reader(['en', 'ch_sim'])
logging.info('load model [en,ch_sim] in %f seconds', time.time()-now)


class Handler(http.server.BaseHTTPRequestHandler):
    def do_GET(self):

        file = '/easyocr/image'+self.path
        t = time.time()
        try:
            list = reader.readtext(file)
            text = ''
            for element in list:
                if len(element) > 1:
                    text += ','+element[1]
            if len(text) > 0:
                text = text[1:]
        except Exception as e:
            logging.warn(e)
        logging.debug('read text from %s=>%s=>%s duration=%fseconds',
                      file, list,  text, time.time()-t)

        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()
        self.wfile.write(text.encode('utf-8'))

        return


with socketserver.TCPServer(("", 8080), Handler) as httpd:
    logging.info('listening http on 8080')
    httpd.serve_forever()
