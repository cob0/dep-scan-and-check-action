import json
import sys

# get file report location from environment variable
report_file_src = sys.argv[1]
cvss_score_threshold = float(sys.argv[2])

try:
    with open(report_file_src, "r") as file:
        data = json.load(file)

        for vuln in data["vulnerabilities"]:
            for rating in vuln["ratings"]:

                cvss_score = float(rating["score"])
                if cvss_score >= cvss_score_threshold:
                    sys.exit(
                        f"[:x:] ERROR: One or more dependencies were identified with vulnerabilities that have a CVSS score greater than or equal to '{cvss_score_threshold}'")
except FileNotFoundError:
    print("[:exclamation:] WARN: There are no report files in the reports folder")

print("[:white_check_mark:] INFO: This report file doesn't contains any dependencies with vulnerabilities")
