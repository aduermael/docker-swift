FROM ubuntu:16.04

RUN apt-get update && apt-get install clang libicu-dev wget python2.7-dev libxml2 -yq

RUN wget -q -O - https://swift.org/keys/all-keys.asc | gpg --import -

ENV SWIFT_BRANCH=swift-3.0.2-release \
	SWIFT_VERSION=swift-3.0.2-RELEASE \
	SWIFT_PLATFORM=ubuntu16.04

ENV PATH /swift/usr/bin:$PATH

WORKDIR /swift

RUN SWIFT_TAR_GZ=$SWIFT_VERSION-$SWIFT_PLATFORM.tar.gz && \
	SWIFT_URL=https://swift.org/builds/$SWIFT_BRANCH/ubuntu1604/$SWIFT_VERSION/$SWIFT_TAR_GZ && \
	wget $SWIFT_URL && \
	wget $SWIFT_URL.sig && \
	gpg --verify $SWIFT_TAR_GZ.sig && \
	tar -xzf $SWIFT_TAR_GZ --strip-components=1 && \
	rm -rf $SWIFT_TAR_GZ $SWIFT_TAR_GZ.sig

CMD ["swift"]