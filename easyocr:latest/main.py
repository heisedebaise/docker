import http.server
import socketserver
import easyocr
import time

now = time.time()
reader = easyocr.Reader(['en', 'ch_sim'])
print('load model [en,ch_sim] in', time.time()-now, 'seconds')


class Handler(http.server.BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()

        self.wfile.write(reader.readtext(
            ('/easyocr/image'+self.path).encode('utf-8')))

        return


with socketserver.TCPServer(("", 8080), Handler) as httpd:
    print('listening http on 8080')
    httpd.serve_forever()
