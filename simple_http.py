# import os
# import posixpath
# import http.server
# import urllib.parse
# import shutil
# import mimetypes

# class SimpleHTTPRequestHandlerWithUpload(http.server.SimpleHTTPRequestHandler):
#     def do_GET(self):
#         if 'Range' in self.headers:
#             self.send_range()
#         else:
#             super().do_GET()

#     def send_range(self):
#         try:
#             path = self.translate_path(self.path)
#             file_size = os.path.getsize(path)
#             range_header = self.headers['Range']
#             byte_range = range_header.replace("bytes=", "").split("-")
#             start = int(byte_range[0])
#             end = int(byte_range[1]) if byte_range[1] else file_size - 1
#             chunk_size = end - start + 1

#             self.send_response(206)
#             self.send_header("Content-Type", mimetypes.guess_type(path)[0] or "application/octet-stream")
#             self.send_header("Content-Range", f"bytes {start}-{end}/{file_size}")
#             self.send_header("Content-Length", str(chunk_size))
#             self.send_header("Accept-Ranges", "bytes")
#             self.end_headers()

#             with open(path, 'rb') as f:
#                 f.seek(start)
#                 self.wfile.write(f.read(chunk_size))

#         except Exception as e:
#             self.send_error(404, f"File not found or error: {str(e)}")

# if __name__ == "__main__":
#     server_address = ("", 8083)
#     httpd = http.server.HTTPServer(server_address, SimpleHTTPRequestHandlerWithUpload)
#     print("Serving on port 8083...")
#     httpd.serve_forever()
 rsync -av --rsh="ssh -o Cipher=none -o Compression=no"  --partial --progress Jinhui zihan@mll-4090-3.cs.northwestern.edu:~/Jinhui