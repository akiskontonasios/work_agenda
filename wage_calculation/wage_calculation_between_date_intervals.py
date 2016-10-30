from utilities import date_utilities


def wage_calculation_between_date_intervals(start_date, end_date, weekly_working_schedule_and_rates):

    weekdays_count = date_utilities.calculate_weekdays_number_in_interval(start_date, end_date)

    wage = 0.0
    for item in weekly_working_schedule_and_rates:
        wage += item.duration_in_hours*item.charge_in_euros*weekdays_count[item.weekday]

    return wage
