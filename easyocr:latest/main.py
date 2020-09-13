import http.server
import socketserver
import datetime
import time
import easyocr

now = time.time()
print(datetime.datetime.now(), 'loading model [en,ch_sim,ch_tra]')
reader = easyocr.Reader(['en', 'ch_sim', 'ch_tra'])
print(datetime.datetime.now(),
      'load model [en,ch_sim,ch_tra] in', time.time()-now, 'seconds')


class Handler(http.server.BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()

        self.wfile.write(reader.readtext(
            ('/easyocr/image'+self.path).encode('utf-8')))

        return


with socketserver.TCPServer(("", 8080), Handler) as httpd:
    print(datetime.datetime.now(), 'listening http on 8080')
    httpd.serve_forever()
