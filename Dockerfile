FROM amazoncorretto:17.0.6-al2023

FROM 2021mt93641/ssa1-furniture-catalog-service:${project.version} as catalog


FROM 2021mt93641/ssa1-furniture-inventory-service:${project.version} as inventory
COPY --from=catalog /opt/ssa1/*.jar /opt/ssa1/


FROM 2021mt93641/ssa1-furniture-order-service:${project.version} as order
COPY --from=inventory /opt/ssa1/*.jar /opt/ssa1/


COPY ${project.basedir}/docker-entrypoint.sh /opt/ssa1/

ARG SPRING_PROFILE=local
ENV SPRING_PROFILE="${SPRING_PROFILE}"
VOLUME /tmp/ssa1/logs
EXPOSE 8081
EXPOSE 8082
EXPOSE 8083

ENTRYPOINT ["sh", "/opt/ssa1/docker-entrypoint.sh"]