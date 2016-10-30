from dateutil import rrule
from collections import Counter


def calculate_weekdays_number_in_interval(start_date, end_date):
    rule = rrule.rrule(rrule.DAILY, dtstart=start_date, until=end_date)
    return dict(Counter(d.strftime('%A') for d in rule))
