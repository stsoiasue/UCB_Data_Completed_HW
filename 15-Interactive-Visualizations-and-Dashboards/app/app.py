# import Flask
from flask import Flask, render_template, redirect, jsonify
from model import session, OTU, Sample, Sample_Meta

# initialize flask app
app = Flask(__name__)

# retun dashboard homepage
@app.route('/')
def index():
    return render_template('index.html')

# return list of sample names
@app.route('/names')
def names():

    sample_names = Sample.__table__.columns._data.keys()[1:]

    return jsonify(sample_names)

# # return list of OTU descriptions
# @app.route('/otu')
# def otu():
#     return

# # return metadata for a given sample
# @app.route('/metadata/<sample>')
# def metadata():
#     return

# # return wekly washing frequency for a given sample
# @app.route('/wfreq/<sample>')
# def wfreq():
#     return

# # return out ID and sample values for given sample
# @app.route('/sample/<sample>')
# def wfreq():
#     return


if __name__ == '__main__':
  app.run(debug=True)