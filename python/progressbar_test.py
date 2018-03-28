
# # github:     https://github.com/niltonvolpato/python-progressbar
# # Example:    http://progressbar-2.readthedocs.io/en/latest/examples.html

import progressbar

widgets = [
    # ' ', progressbar.Percentage(),
    ' ', progressbar.SimpleProgress(format='(%(value_s)s of %(max_value_s)s)'),
    ' ', progressbar.Bar('>', fill='.'),
    ' ', progressbar.ETA(format_finished='- %(seconds)s  -', format='- ETA: %(seconds)s -', ),
    # ' - ', progressbar.DynamicMessage('loss'),
    ' ', progressbar.DynamicMessage('message'),
    '              '
]
my_progress_bar = progressbar.ProgressBar(redirect_stdout=True, widgets=widgets)

m = 100
my_progress_bar.start(m)
for i in range(m):
    my_progress_bar.update(i, message="test "+str(i))

my_progress_bar.finish()
