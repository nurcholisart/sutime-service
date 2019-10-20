# Dockerized Stanford CoreNLP's SUTime

This package is a dockerized version for [Stanford CoreNLP's SUTime](https://nlp.stanford.edu/software/sutime.shtml) Java library. This package uses the Python wrapper created by https://github.com/FraBle/python-sutime



## Installation

Pull the image from Docker Hub:

```
docker run -d -p 5000:5000 nurcholisart/pysutime
```

You can also clone this repository and build the image by your self:

```
git clone https://github.com/nurcholisart/sutime-service
cd ./sutime-service
docker build -t nurcholisart/pysutime .
```



## Usage

After the installation process has finished, you can do a http request, like this:

```
curl -X GET \
  'http://localhost:5000/parse?text=i%20want%20to%20know%20earthquake%20history%20two%20years%20ago'
```