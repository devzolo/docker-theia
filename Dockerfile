FROM theiaide/theia-full:latest

LABEL maintainer="devzolo <coder.devzolo@gmail.com>"

USER root
#RUN npm install socket.io ws express http-proxy bagpipe chokidar request nodemailer await-signal log4js moment
RUN mkdir /home/theia/agent && \
	cd /home/theia/agent && npm init -y && npm install http-proxy basic-auth
ADD proxy.js /home/theia/agent
ENV username=devzolo
ENV password=fcea920f7412b5da7be0cf42b8c93759
EXPOSE 5050


# RUN apk add --no-cache subversion screen util-linux curl && \
# 	apk add --virtual build-dependencies build-base && \
# 	rm -rf /var/cache/apk/* && \
# 	npm install -g node-gyp supervisor && cd / && npm init -y && npm install socket.io ws express http-proxy bagpipe chokidar request nodemailer await-signal log4js moment && \
# 	chown -R theia:theia /node_modules && chown -R theia:theia /usr/local/lib/node_modules && chown -R theia:theia /home/theia/.npm && chown -R theia:theia /usr/local/bin/

RUN apk add --no-cache subversion screen util-linux curl && \
	apk add --virtual build-dependencies build-base && \
	rm -rf /var/cache/apk/* && \
	npm install -g node-gyp supervisor && cd / && npm init -y && npm install socket.io ws express http-proxy bagpipe chokidar request nodemailer await-signal log4js moment

ADD *.sh /
RUN sed -i 's/\r$//' /*.sh ; chmod +x /*.sh && \
	echo $(date "+%Y-%m-%d_%H:%M:%S") >> /.image_times && \
	echo $(date "+%Y-%m-%d_%H:%M:%S") > /.image_time && \
	echo "devzolo/theia" >> /.image_names && \
	echo "devzolo/theia" > /.image_name
#ENTRYPOINT [ "node", "/home/theia/agent/proxy.js" ]
ENTRYPOINT []
#CMD node /home/theia/src-gen/backend/main.js /home/project --hostname=0.0.0.0
#CMD node /home/theia/agent/proxy.js
RUN echo 'nohup node /home/theia/agent/proxy.js > /tmp/proxy.out &' >> /start.sh && \
#RUN echo 'nohup node /home/theia/src-gen/backend/main.js /home/project --hostname=0.0.0.0 --startup-timeout=-1 --inspect=0.0.0.0:9229 > /tmp/theia.out &' >> /start.sh
	echo 'node /home/theia/src-gen/backend/main.js /home/project --hostname=0.0.0.0 --startup-timeout=-1 --inspect=0.0.0.0:9229' >> /start.sh

#USER theia
CMD /task.sh ; /start.sh ; bash

#docker build -t devzolo/theia:latest .
#docker rm -f theia; docker run -it --privileged -p 15050:5050 --expose 9229 -p 19229:9229 -v "$(pwd):/home/project:cached" -e "username=devzolo" -e "password=fcea920f7412b5da7be0cf42b8c93759" --name theia devzolo/theia:latest
#docker rm -f theia; docker run -it --privileged --expose 1080 -p 1080:1080 --expose 3000 -p 3000:3000 -p 15050:5050 --expose 9229 -p 19229:9229 -v "$(pwd):/home/project:cached" -e "username=devzolo" -e "password=fcea920f7412b5da7be0cf42b8c93759" --name theia devzolo/theia:latest
