import falcon

class HelloResource(object):
    def on_get(self, req, resp):
        resp.status = falcon.HTTP_200
        resp.body = ("Hello, World!")

app = falcon.API()

hello = HelloResource()

app.add_route('/', hello)
