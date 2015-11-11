FROM ajjenda/ionic
MAINTAINER Yoseph Reuveni <yoseph.reuveni@gmail.com>
 
RUN phonegap -v
RUN cordova -v
RUN ionic -v
RUN n -V
RUN bower -v
RUN node -v

COPY ajjenda-mobile-html5-parvindra.tar.gz .
RUN tar -zxf ajjenda-mobile-html5-parvindra.tar.gz

# Expose the ports we're interested in
EXPOSE 8100 8100
EXPOSE 35729 35729

# Set the default command to run on boot
# This will boot IONIC in the standalone mode and bind to all interface
WORKDIR Ajjenda
CMD ["ionic", "serve", "-c", "-s", "--address", "0.0.0.0"]
