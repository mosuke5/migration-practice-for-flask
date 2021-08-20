FROM redhat/ubi8:8.4
RUN dnf install -y python3-devel
RUN mkdir /app
WORKDIR /app
ADD requirements.txt /app/
RUN pip install -r requirements.txt
ADD . /app/
CMD ["flask", "run"]
