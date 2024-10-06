FROM ghcr.io/owasp-dep-scan/dep-scan:release-5.x
LABEL mantainer="OWASP Fundation & cob0"\
      org.opencontainers.image.authors="Team AppThreat <cloud@appthreat.com>, cob0 <cob0@tutanota.com>"\
      org.opencontainers.image.title="dep-scan-and-check"\
      org.opencontainers.image.description="Fully open-source security audit tool for project dependencies based on known vulnerabilities and advisories with analysis check script"\
      org.opencontainers.image.source="https://github.com/cob0/dep-scan-and-check-action"\
      org.opencontainers.image.version="1.0.0"
      org.opencontainers.image.licenses=MIT

COPY dep_scan_report_checker.py /opt/dep-scan

ENTRYPOINT [ "depscan" ]