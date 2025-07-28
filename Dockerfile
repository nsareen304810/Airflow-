FROM quay.io/astronomer/airflow:2.8.1-buster-onbuild
USER root
RUN pip install --no-cache-dir apache-airflow-providers-cncf-kubernetes                                  apache-airflow-providers-slack                                  apache-airflow-exporter
USER astro
