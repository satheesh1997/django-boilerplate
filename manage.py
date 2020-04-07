#!/usr/bin/env python

import os
import sys

import coverage


def start_coverage(cov):
    cov.set_option("report:show_missing", True)
    cov.erase()
    cov.start()


def stop_coverage(cov):
    cov.stop()
    cov.save()
    cov.html_report(directory="coveragehtml")
    cov.report()


def main():
    os.environ.setdefault("DJANGO_SETTINGS_MODULE", "settings")
    cov = coverage.coverage(source=["apps"], omit=["*/tests/*"])
    test_mode = "test" in sys.argv

    try:
        from django.core.management import execute_from_command_line
    except ImportError as exc:
        raise ImportError(
            "Couldn't import Django. Are you sure it's installed and "
            "available on your PYTHONPATH environment variable? Did you "
            "forget to activate a virtual environment?"
        ) from exc

    if test_mode:
        start_coverage(cov)

    execute_from_command_line(sys.argv)

    if test_mode:
        stop_coverage(cov)


if __name__ == "__main__":
    main()
