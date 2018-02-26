FROM elek/spark-base
ENV HADOOP_CONF_DIR /opt/livy/conf
ENV CONF_DIR /opt/livy/conf
ENV SPARK_HOME /opt/spark
ENV SPARK_CONF_DIR /opt/livy/conf
ENV LIVY_LOG_DIR /var/log/livy
RUN mkdir $LIVY_LOG_DIR
RUN apk add --update python3 R && rm -rf /var/cache/apk/*
ENV PYSPARK_PYTHON python3
ADD url ./
RUN wget `cat url` -O livy.zip && unzip livy.zip && rm livy.zip && mv livy* livy
ADD defaults/* defaults/
CMD ["/opt/livy/bin/livy-server"]
