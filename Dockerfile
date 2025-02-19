#
# Copyright © 2017 The Thingsboard Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

FROM openjdk:8-jre

RUN wget -O tb-gateway.deb https://github.com/thingsboard/thingsboard-gateway/releases/download/2.2.1rc/tb-gateway-2.2.1rc.deb \
  && apt-get update 
RUN dpkg -i tb-gateway.deb; exit 0
ADD run-application.sh /run-application.sh
RUN chmod +x /run-application.sh
RUN apt-get -f install -y
RUN mkdir /tmp/tb-gateway \
  && mkdir /tmp/tb-gateway/conf \
  && cp -a /etc/tb-gateway/conf/. /tmp/tb-gateway/conf
RUN rm tb-gateway.deb
