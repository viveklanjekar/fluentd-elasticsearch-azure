FROM quay.io/fluentd_elasticsearch/fluentd:v3.0.4

RUN apt-get update \
 && buildDeps="build-essential zlib1g-dev ruby-dev" \
 && apt-get install -y --no-install-recommends $buildDeps \
 && gem install fluent-plugin-azure-storage-append-blob --version 0.2.1 \
 && gem install fluent-plugin-concat --version 2.4.0 \
 && gem install fluent-plugin-s3 --version 1.4.0 \
 && gem install fluent-plugin-kafka --version 0.14.2 \
 && gem install fluent-plugin-grok-parser --version 2.6.1 \
 && gem install fluent-plugin-rewrite-tag-filter --version 2.3.0 \
 && gem install fluent-plugin-record-reformer --version 0.9.1 \
 && gem install fluent-plugin-detect-exceptions --version 0.0.13 \
 && gem install fluent-plugin-elasticsearch --version 4.1.3 \
 && gem install fluent-plugin-kubernetes_metadata_filter --version 2.5.2 \
 && gem install fluent-plugin-parser-cri --version 0.1.1 \
 && gem install fluent-plugin-multi-format-parser --version 1.0.0 \
 && apt-get purge -y --auto-remove \
                  -o APT::AutoRemove::RecommendsImportant=false \
                  $buildDeps \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

EXPOSE 24224 5140
