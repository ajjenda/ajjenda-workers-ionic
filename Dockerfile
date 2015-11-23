FROM ajjenda/ionic
MAINTAINER Yoseph Reuveni <yoseph.reuveni@gmail.com>
 
RUN phonegap -v && \
    cordova -v && \
    ionic -v  && \
    n -V  && \
    bower -v  && \
    node -v

COPY ajjenda-mobile-workers.tar.gz .
RUN tar -zxf *.tar.gz && rm *.tar.gz && mv Ajjenda AjjendaWorkers

# Expose the ports we're interested in
EXPOSE 8100 8100
EXPOSE 35729 35729

# Set the default command to run on boot
# This will boot IONIC in the standalone mode and bind to all interface
WORKDIR AjjendaWorkers
CMD ["ionic", "serve", "-c", "-s", "--address", "0.0.0.0"]
