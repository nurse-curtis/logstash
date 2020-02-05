FROM docker.elastic.co/logstash/logstash-oss:7.5.2

RUN rm -f /usr/share/logstash/pipeline/logstash.conf && \
  bin/logstash-plugin install logstash-filter-metricize && \
  bin/logstash-plugin install logstash-filter-opnsensefilter && \
  bin/logstash-plugin install logstash-codec-sflow && \
  bin/logstash-plugin install logstash-output-elasticsearch && \
  bin/logstash-plugin update logstash-codec-netflow \
                                        logstash-input-udp \
                                        logstash-input-tcp \
                                        logstash-filter-cidr \
                                        logstash-filter-date \
                                        logstash-filter-dns \
                                        logstash-filter-geoip \
                                        logstash-filter-mutate \
                                        logstash-filter-ruby \
                                        logstash-filter-translate
