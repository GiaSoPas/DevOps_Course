from flask import Flask, request

web_app = Flask(__name__)

@web_app.route("/", methods=['POST', 'GET'])
def data_json():
    if request.method == 'POST':

        request_data = request.get_json(force=True)

        animal = request_data['animal']
        sound = request_data['sound']
        count = request_data['count']

        out = '{} says {}\n'.format(animal, sound) * count + 'Made with love by Ivan Ulitin\n'
        return out

    return "for json object"


if __name__  == "__main__":
    web_app.run(host='0.0.0.0', port=8080)
